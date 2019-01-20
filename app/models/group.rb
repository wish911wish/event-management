class Group < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_create :set_token
  has_many      :users, through: :group_members
  has_many      :group_members, dependent: :destroy
  has_many      :events

  validates_presence_of   :image
  validates_integrity_of  :image
  validates_processing_of :image

  private
  def set_token
    self.token = SecureRandom.urlsafe_base64(25)
  end
end
