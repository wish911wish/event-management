class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many      :groups, through: :group_members
  has_many      :group_members, dependent: :destroy
  # attr_accessible :email, :password, :remember_me, :avatar, :avatar_cache, :remove_avatar

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  has_many    :events
  has_many    :events, through: :attend_statuses
  has_many    :attend_statuses
end
