class Post < ActiveRecord::Base
	has_many :comments
	has_many :upvotes
	validates :title, presence: true,
            length: { minimum: 5 }
end
