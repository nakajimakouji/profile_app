class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_one_attached :avatar_image do |attachable|
    attachable.variant :display, resize_to_limit: [200, 200]
  end

  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  has_secure_password
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
  validates :profile_text, length: { minimum: 50, maximum: 199 }, allow_nil: true
  validate :avatar_image_validation

  private
    
    def downcase_email
      self.email = email.downcase
    end

    def avatar_image_validation
      if avatar_image.attached? && !avatar_image.blob.content_type.in?(%w(image/jpeg image/png))
        avatar_image.purge # 不適切なファイルを削除
        errors.add(:avatar_image, 'はJPEGまたはPNG形式である必要があります。')
      end
      if avatar_image.attached? && avatar_image.blob.byte_size > 1.megabyte
        avatar_image.purge # 大きすぎるファイルを削除
        errors.add(:avatar_image, 'のサイズは1MB以下にしてください。')
      end
    end
end
