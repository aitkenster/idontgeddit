require 'rails_helper'

describe 'iDontGeddits' do 

	context 'no iDontGeddits' do 

		it 'shows a message' do 
			visit '/posts'
			expect(page).to have_content 'The internet is not confused at the moment. Are you?'
		end

	context 'one iDontGeddit' do 

		it 'shows one iDontGeddit when there is only one present' do 
			visit '/posts'
			click_link "New iDontGeddit"
			fill_in "Title", with: "I just don't geddit"
			fill_in "Text", with: "This is what I don't get"
			expect(page).to have_content "I just don't geddit"
		end

	end

	end

end