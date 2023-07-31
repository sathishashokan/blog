class Post < ApplicationRecord
    mount_uploader :thumbnail_image, ThumbnailImageUploader

    belongs_to :user, foreign_key: "author_id"
    has_and_belongs_to_many :categories
    has_many :comments, dependent: :destroy
    # has_one_attached :thumbnail_image
    # validates :category_id, presence: true
end
