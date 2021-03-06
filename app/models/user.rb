class User < ApplicationRecord
    has_many :articles
    before_save { self.email = email.downcase }      # Email should be save in downcase to database.
    validates :username, presence: true,
              uniqueness: { case_sensitive: false }, 
              length: { minimum: 3, maximum: 20}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
              uniqueness: { case_sensitive: false },
              length: { maximum: 30 }, format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    
end 