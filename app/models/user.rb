class User < ApplicationRecord
  has_many :articles, dependent: :destroy #associations IT WILL DESTROY all articles if the user is destroyed
  before_save { self.email = email.downcase } #converts email to downcase before saving
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: {minimum: 3, maximum: 25}#validates username is present
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: {case_sensitive: false},
            format:{ with: VALID_EMAIL_REGEX }
  has_secure_password
end
