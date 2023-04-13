class Event < ApplicationRecord
    has_one_attached :title_image
    has_rich_text :body

    belongs_to :author, class_name: 'User', foreign_key: 'user_id'
end
