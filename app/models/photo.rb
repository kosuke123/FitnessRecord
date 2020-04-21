class Photo < ApplicationRecord
    mount_uploader :image, ImageUploader   <!-- 記載するのはこれ！ -->
  end