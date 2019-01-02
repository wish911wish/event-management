class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many    :events
  has_many    :events, through: :attend_statuses
  has_many    :attend_statuses
end
