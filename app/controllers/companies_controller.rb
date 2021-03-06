class CompaniesController < ApplicationController
  before_action :authenticate_employee!, only: [:edit, :update]
  before_action :set_company, only: [:edit, :update]

  def index
    @companies = Company.where(is_public: true)
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to employee_path(current_employee), notice: "Company was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_company
    redirect_to root_path, alert: "権限がありません" if params[:id].to_i != current_employee.company.id
    @company = Company.find(current_employee.company.id)
  end

  def company_params
    params.require(:company).permit(
      :name, :company_url, :contact_phone_number, :business_category_id, :address,
      :business_description, :number_of_employee, :contact_name, :contact_email, :thumbnail
    )
  end
end
