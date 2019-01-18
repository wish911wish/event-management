class Event < ApplicationRecord
  after_initialize :set_token
  belongs_to    :user
  has_many      :users, through: :attend_statuses
  has_many      :attend_statuses, dependent: :destroy
  validates     :name, presence: true

  private
  def set_token
    self.token = SecureRandom.urlsafe_base64(25)
  end

end
