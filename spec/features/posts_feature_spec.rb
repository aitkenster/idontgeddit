require 'rails_helper'

describe 'posts' do 

	context 'no posts' do 

		it 'shows a message' do 
			visit '/posts'
			expect(page).to have_content 'The internet is not confused at the moment. Are you?'
		end

	end

	context 'one post' do 
		before(:each) do
				@nicola = create(:user)
				login_as @nicola
		end
		
		it 'shows one post when there is only one present' do 
			visit '/posts'
			click_link "Text DontGeddit"
			fill_in "Title", with: "I just don't geddit"
			fill_in "Text", with: "This is what I don't get"
			click_button "Create DontGeddit"
			expect(page).to have_content "I just don't geddit"
		end
	end

	context 'when user is not logged in' do
			it 'does not allow the user to create a post' do
				visit '/posts'
				click_link "Text DontGeddit"
				expect(page).to have_content("Sign in to post")
			end
		end 

		context 'when user is logged in' do 
			before(:each) do
				@nicola = create(:user)
				login_as @nicola
			end
			it 'allows the user to add a link post' do 
				visit '/posts'
				click_link "Link DontGeddit"
				fill_in "Title", with: "Here's a link I don't get"
				fill_in "Url", with: "http://www.reddit.com"
				click_button "Create DontGeddit"
			end
		end

end