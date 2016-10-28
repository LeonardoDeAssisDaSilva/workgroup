class Group < ApplicationRecord
  has_many :members, :dependent => :destroy
  has_many :users, through: :members

  validates :name, presence: true, length: { maximum: 50 }
  validates :area, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }
end
