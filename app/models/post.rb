class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :tittle, presence: true
    validates :content, presence: true
    belongs_to :user
end
