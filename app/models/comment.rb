class Comment < ApplicationRecord
  has_ancestry
  belongs_to :task, dependent: :destroy, inverse_of: :comments
  belongs_to :user, dependent: :destroy, inverse_of: :comments

  validates :content,   presence: true
  validates :user_id,   presence: true
  validates :task_id,   presence: true
end
