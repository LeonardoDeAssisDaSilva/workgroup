class Member < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :group, presence: true
  validates :user, presence: true
  validates :admin, presence: true
end
