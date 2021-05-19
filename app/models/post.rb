class Post < ApplicationRecord
  has_rich_text :body
  validates :title, presence: { message: 'is required' },
                    length: { in: 5..32, message: 'should be from 5 to 32 characters long' }
  validates :body, presence: { message: 'is required' }, length: { minimum: 10, message: 'at least 10' }
  belongs_to :user
end
