class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_many :nuances
  has_many :listes, dependent: :destroy

  def self.find_for_facebook_oauth(auth)
    user_params = { email: auth.info[:email], first_name: auth.info[:first_name], last_name: auth.info[:last_name], uid: auth.info[:uid], provider: auth.info[:provider] }
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    puts user_params
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      puts user
      user.password = Devise.friendly_token[0,20]
      user.save
    end

    return user
  end

  def admin?
    status == 'admin'
  end
end
