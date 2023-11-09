class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :posts
  validates :email, :password, :password_confirmation, presence: true
  validates :password, :password_confirmation, length: { minimum: 8 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
