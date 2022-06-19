class NullTrueToInternshipsStartDateAndEndDate < ActiveRecord::Migration[7.0]
  def change
    change_column_null :internships, :start_date, true
    change_column_null :internships, :end_date, true
  end
end
