class Photo < ApplicationRecord
    mount_uploader :image, ImageUploader  
    mount_uploader :banner, BannerUploader
  end