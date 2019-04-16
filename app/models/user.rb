class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_many :nuances
  has_many :listes, dependent: :destroy

   def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h
    puts "before looking for user"

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    puts "after looking for user"
    puts user_params
    if user
      user.update(user_params)
    else
      puts "before creating new user"
      user = User.new(user_params)
      puts user
      user.password = Devise.friendly_token[0,20] # Fake password for validation
      puts "before saving new user"
      user.save
      puts "after saving new user"
    end

    return user
  end
end
