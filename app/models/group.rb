class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :area, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }
  
  self.per_page = 15
end
