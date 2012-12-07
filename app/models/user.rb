class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :current_password

  attr_accessor :current_password

  has_many :authentications
  has_many :roles

  has_attached_file :profile_picture,
                      styles: { medium: '300x300#', thumb: '100x100#' },
                      default_url: '/missing-:style.png'

  def admin?
    roles.where(name: :admin).any?
  end

  # Helper for user creation via omniauth
  def apply_omniauth(omniauth)
    authentications.build(provider: omniauth['provider'], uid: omniauth['uid'])
  end

  # Override devise password_required if user is signing in via omniauth
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

end
