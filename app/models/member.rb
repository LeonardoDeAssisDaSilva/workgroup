class Member < ApplicationRecord
  before_save :default_values

  belongs_to :group
  belongs_to :user

  validates :group, presence: true
  validates :user, presence: true
  

  private

  def default_values
    self.admin ||= false
  end
end
