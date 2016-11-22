class Member < ApplicationRecord
  before_save :default_values

  belongs_to :group, inverse_of: :members
  belongs_to :user,  inverse_of: :members
  has_many :invitations

  validates :group, presence: true
  validates :user,  presence: true
  validates_uniqueness_of :user_id, :scope => :group_id

  private

    def default_values
      self.admin ||= false
    end
end
