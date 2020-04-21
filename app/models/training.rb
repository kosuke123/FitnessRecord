class Training < ApplicationRecord
#アソシエーション(1:多)
belongs_to :user

has_many :likes
has_many :liked_users, through: :likes, source: :user

belongs_to :kind, optional: true
mount_uploader :image, ImageUploader

validates :body, {presence: true}
validates :kind_id, {presence: true}

end