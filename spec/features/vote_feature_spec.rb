require 'rails_helper'

describe 'vote' do 
	before(:each) do 
		post = create(:post)
		visit '/posts'
	end

	context 'when the user is on the homepage' do 

		it 'a user should be able to upvote a review' do 
			click_link '↑'
			expect(page).to have_content '1 vote'
		end

		it 'a user should be able to downvote a review' do 
			click_link '↓'
			expect(page).to have_content '-1 vote'
		end

	end

end