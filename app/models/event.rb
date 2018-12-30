class Event < ApplicationRecord
  belongs_to    :user
  has_many      :users, through: :attend_statuses
  validates     :name, presence: true
end
