require 'rails_helper'

describe 'posts' do 

	context 'no posts' do 

		it 'shows a message' do 
			visit '/posts'
			expect(page).to have_content 'The internet is not confused at the moment. Are you?'
		end

	end

	context 'one post' do 

		it 'shows one post when there is only one present' do 
			visit '/posts'
			click_link "New DontGeddit Text"
			fill_in "Title", with: "I just don't geddit"
			fill_in "Text", with: "This is what I don't get"
			click_button "Create DontGeddit"
			expect(page).to have_content "I just don't geddit"
		end
	end

	context 'adding posts' do 
		it 'allows the user to add a link post' do 
			visit '/posts'
			click_link "New DontGeddit Link"
			fill_in "Title", with: "Here's a link I don't get"
			fill_in "Url", with: "http://www.reddit.com"
			click_button "Create DontGeddit"
			click_link "Here's a link I don't get"
			expect
		end
	end

end