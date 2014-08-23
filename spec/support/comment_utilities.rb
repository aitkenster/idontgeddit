require 'rails_helper'

def leave_review(review)
	visit posts_path
	click_link "Comments"
	fill_in 'Body', with: review
	click_button 'Add Comment'
end