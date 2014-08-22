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
			click_link "New DontGeddit"
			fill_in "Title", with: "I just don't geddit"
			fill_in "Text", with: "This is what I don't get"
			click_button "Create DontGeddit"
			expect(page).to have_content "I just don't geddit"
			expect(page).to have_content "This is what I don't get"
		
		end
	end
end