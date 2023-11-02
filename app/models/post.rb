class Post < ApplicationRecord
    belongs_to :user
    validates :title, :time_spent, :difficulty, :price, :review, :image, :user_id, presence: true
end
