class Post < ActiveRecord::Base
	has_many :comments
	has_many :upvotes
	has_many :downvotes
	validates :title, presence: true,
            length: { minimum: 5 }
end
