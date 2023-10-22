class User < ApplicationRecord
  has_many :items, dependent: :destroy

  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  has_secure_password
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
  validates :profile_text, length: { minimum: 50, maximum: 199 }, allow_nil: true


  private
    
    def downcase_email
      self.email = email.downcase
    end
end
