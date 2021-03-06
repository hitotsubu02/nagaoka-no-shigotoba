class Internship < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }, uniqueness: { scope: :company_id }
  validates :description, presence: true
  validates :internship_attendance_type_id, presence: true
  validates :internship_category_id, presence: true


  belongs_to :company
  belongs_to :internship_category
  belongs_to :internship_attendance_type
  has_many :students, through: :internship_carts
  has_many :internship_carts, dependent: :destroy
  has_many :students, through: :internship_orders
  has_many :internship_orders, dependent: :destroy

  has_one_attached :thumbnail

  def title_with_company_name
    company.name + ' | ' + title
  end

  def terms
    if start_date.present? && end_date.present?
      ((end_date - start_date).to_i + 1).to_s + '日間'
    elsif term_text.present?
      'term_text'
    else
      '随時'
    end
  end

  def terms_label
    case terms
    when 1 then '1日'
    when 2 then '2日'
    when 3, 4, 5, 6, 7 then '1週間'
    else '1週間より多い'
    end
  end

  def image_urls
    array = []
    array = array + [gif_url] if gif_url.present?
    array = array + [thumbnail.representation(resize_to_limit: [800, 800])] if thumbnail.representable?
    array = ['no_image.png'] if array.empty?
    array
  end

  private

  ransacker :terms do
    Arel.sql("start_date is not null and end_date is not null and case when end_date - start_date + 1 = 1 then '1日' when end_date - start_date + 1 >= 2 and end_date - start_date + 1 <= 4 then '2~4日' when end_date - start_date + 1 = 5 then '5日' else '5日より多い' end")
  end
end
