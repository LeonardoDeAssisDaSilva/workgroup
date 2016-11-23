class Comment < ApplicationRecord
  has_ancestry
  acts_as_votable
  belongs_to :task, dependent: :destroy, inverse_of: :comments
  belongs_to :user, dependent: :destroy, inverse_of: :comments

  validates :content,   presence: true, length: { maximum: 500 }
  validates :user_id,   presence: true
  validates :task_id,   presence: true
end
