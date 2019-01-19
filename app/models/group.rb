class Group < ApplicationRecord
  before_create :set_token
  has_many      :users, through: :group_members
  has_many      :group_members, dependent: :destroy

  private
  def set_token
    self.token = SecureRandom.urlsafe_base64(25)
  end
end
