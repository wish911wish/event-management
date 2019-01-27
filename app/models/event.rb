class Event < ApplicationRecord
  before_create :set_token
  belongs_to    :user
  belongs_to    :group
  has_many      :users, through: :attend_statuses
  has_many      :attend_statuses, dependent: :destroy
  validates     :name, presence: true

  private
  def set_token
    self.token = SecureRandom.urlsafe_base64(25)
  end

end
