class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :member
  belongs_to :group
end
