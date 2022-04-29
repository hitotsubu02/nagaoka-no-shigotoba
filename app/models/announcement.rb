class Announcement < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :contents, presence: true

  belongs_to :announcement_category
end
