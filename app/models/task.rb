class Task < ApplicationRecord
  belongs_to :group, inverse_of: :tasks
  belongs_to :user, inverse_of: :tasks

  validates :user_id,   presence: true
  validates :group_id,   presence: true
  validates_uniqueness_of :user_id, :scope => :group_id
  validates :title,       presence: true
  validates :priority,    presence: true
  validates :deadline,    presence: true
  validates :description, presence: true, length: { maximum: 500 }

end
