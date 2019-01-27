class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :omniauthable, omniauth_providers: [:facebook]
  has_many    :groups, through: :group_members
  has_many    :group_members, dependent: :destroy
  has_many    :events
  has_many    :events, through: :attend_statuses
  has_many    :attend_statuses

  class << self
    def find_or_create_for_oauth(auth)
      mount_uploader :image, ImageUploader
      find_or_create_by!(email: auth.info.email) do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.image = auth.info.image
        password = Devise.friendly_token[0..5]
        user.password = password
      end
    end

    def new_with_session(params, session)
      if user_attributes = session['devise.user_attributes']
        new(user_attributes) { |user| user.attributes = params }
      else
        super
      end
    end
  end
end
