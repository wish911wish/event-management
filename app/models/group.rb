class Group < ApplicationRecord
  has_many      :users, through: :group_members
  has_many      :group_members, dependent: :destroy
end
