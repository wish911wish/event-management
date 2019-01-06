class Event < ApplicationRecord
  belongs_to    :user
  has_many      :users, through: :attend_statuses
  has_many      :attend_statuses, dependent: :destroy
  validates     :name, presence: true
end
