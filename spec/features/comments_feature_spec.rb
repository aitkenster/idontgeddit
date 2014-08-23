require 'rails_helper'

describe 'comments' do

	before(:each) do 
		post = create(:post)
		visit '/posts'
	end 

	it "should allow comments to be added to posts" do 
		click_link "Comments"
		fill_in "Body", with: "This is a test comment"
		click_button "Add Comment"
		expect(page).to have_content("This is a test comment")
	end

	context 'when there is a comment on a post' do 

		it 'should display the comment' do
			@test_post = Post.new(title: "this", text: "that") 
			leave_review("This is a comment")
			expect(page).to have_content("This is a comment")
		end

	end
end