class Group < ApplicationRecord
  has_many :members, :dependent => :destroy
  has_many :users, through: :members

  before_save :default_values

  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 50 }
  validates :area, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }

  # Search method
  def self.search(search)
    where("name LIKE ? or area LIKE ? or description LIKE ?","%#{search}%",
                                                             "%#{search}%",
                                                             "%#{search}%")
  end

  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "deve ser menor que 5MB")
      end
    end

    def default_values
       self.picture = "/uploads/group/picture/default/group.png"
    end
end
