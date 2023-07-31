class Post < ApplicationRecord
    has_and_belongs_to_many :categories
    # validates :category_id, presence: true
end
