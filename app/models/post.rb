class Post < ApplicationRecord
  has_rich_text :content
  validates :title, presence: { message: 'is required' },
                    length: { in: 5..32, message: 'Title should be from 5 to 32 characters long' }
  validates :content, presence: { message: 'is required' },
                      length: { in: 10..500, message: 'Content should be from 10 to 500 characters long' }
  belongs_to :user
end
