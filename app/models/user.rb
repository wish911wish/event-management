class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many      :groups, through: :group_members
  has_many      :group_members, dependent: :destroy
  # attr_accessible :email, :password, :remember_me, :image, :image_cache, :remove_image

  validates_presence_of   :image
  validates_integrity_of  :image
  validates_processing_of :image

  has_many    :events
  has_many    :events, through: :attend_statuses
  has_many    :attend_statuses
end
