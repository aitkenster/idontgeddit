require 'rails_helper'

describe 'iDontGeddits' do 

	context 'no iDontGeddits' do 

		it 'shows a message' do 
			visit '/idontgeddits'
			expect(page).to have_content 'The internet is not confused at the moment. Are you?'
		end

	# context 'one iDontGeddit' do 

	# 	it 'shows one iDontGeddit when there is only one present' do 
	# 		Idontgeddit.create("")
	# 	end

	# end

	end

end