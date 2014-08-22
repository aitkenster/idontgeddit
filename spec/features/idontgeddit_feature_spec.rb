require 'rails_helper'

describe 'iDontGeddits' do 

	context 'no iDontGeddits' do 

		it 'shows a message' do 
			visit '/idontgeddits'
			expect(page).to have_content 'The internet is not confused at the moment. Are you?'
		end

	end

end