class Task < ApplicationRecord
  belongs_to :member, inverse_of: :tasks
  delegate :group, to: :member

  validates :member_id,   presence: true
  validates :title,       presence: true
  validates :priority,    presence: true
  validates :deadline,    presence: true
  validates :description, presence: true, length: { maximum: 500 }
end
