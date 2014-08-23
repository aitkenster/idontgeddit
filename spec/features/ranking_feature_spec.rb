require 'rails_helper'

describe 'hot ranking page' do
	context 'when a user goes to the hot page' do 

		before(:each) do 
				Timecop.freeze(Time.local(2014, 8, 1, 10 ,5, 0)) do 
					@hot_post = create(:hot_post)
					10.times{@hot_post.upvotes.create}
					@not_hot_post = create(:not_hot_post)
				end
		end

		it 'They will see pages ranked in order of newness and popularity' do 
			visit '/posts'
			click_link 'hot'
			save_and_open_page
			expect(page.body.index(@hot_post.title).should < page.body.index(@not_hot_post.title))

		end
	end
end