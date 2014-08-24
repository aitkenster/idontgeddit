require 'rails_helper'

describe 'rising ranking system' do 
	context 'when two posts are create simultaneously with no votes' do 
		before(:each) do
				Timecop.freeze(Time.local(2014, 8, 1, 10 ,5, 0)) do 
				@not_hot_post_one = create(:not_hot_post)
				@not_hot_post_two = create(:not_hot_post)
			end
		end

		it 'they should have the same ranking' do 
			expect(@not_hot_post_one.rising_ranking).to equal @not_hot_post_two.rising_ranking
		end
	end

	context 'when a slightly older post has many more votes than a newer post' do 
		before(:each) do
				Timecop.freeze(Time.local(2014, 8, 22, 10 ,5, 0)) do 
				@hot_post = create(:hot_post)
			end
			@not_hot_post = create(:not_hot_post)
			30.times{@hot_post.upvotes.create}
		end

		it ' the older post should be ranked higher' do 
			expect(@hot_post.rising_ranking).to be > @not_hot_post.rising_ranking
		end
	end

	context 'when a very new post has a lot of votes, but less than an older post' do 
		before(:each) do
			Timecop.freeze(Time.local(2014, 7, 22, 10 ,5, 0)) do 
				@old_post = create(:post)
			end
			@hot_post = create(:hot_post)
			25.times{@hot_post.upvotes.create}
			30.times{@old_post.upvotes.create}
		end
		it 'the newer post should be ranked higher' do
			expect(@hot_post.rising_ranking).to be > @old_post.rising_ranking
		end
	end

end