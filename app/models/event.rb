class Event < ApplicationRecord
    has_one_attached :title_image
    has_rich_text :body
end
