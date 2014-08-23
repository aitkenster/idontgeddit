require 'rails_helper'

describe 'hot posts ranking system' do 

	context 'two posts are created at the same time and have no votes' do 
		before(:each) do 
			Timecop.freeze(Time.local(2014, 8, 1, 10 ,5, 0)) do 
				@not_hot_post_one = create(:not_hot_post)
				@not_hot_post_two = create(:not_hot_post)
			end
		end
		it 'they should have the same ranking' do 
			expect @not_hot_post_one.ranking == @not_hot_post_two.ranking
		end
	end

	context 'two posts are created simultaneously and one post has a postive ranking' do 
		before(:each) do 
			Timecop.freeze(Time.local(2014, 8, 1, 10 ,5, 0)) do 
					@hot_post = create(:post)
					@not_hot_post = create(:post)
			end
			10.times{@hot_post.upvotes.create}
		end

		it 'the one with the best voting score should have the higher ranking' do 
			expect @hot_post.ranking > @not_hot_post.ranking
		end
	end

	context 'an old post and a new one have the same number of votes' do 
		before(:each) do 
			Timecop.freeze(Time.local(2013, 8, 1, 10 ,5, 0)) do 
				@hot_old_post = create(:post)
			end
			@hot_new_post = create(:post)
			10.times{@hot_new_post.upvotes.create}
			10.times{@hot_old_post.upvotes.create}
		end
		it 'the newer one has a higher score' do 
			expect @hot_new_post.ranking > @hot_old_post.ranking
		end
	end

	context 'two posts are created simultaneously. One post has a negative ranking and one has no ranking' do 
		before(:each) do 
			Timecop.freeze(Time.local(2014, 8, 1, 10 ,5, 0)) do 
				@not_hot_post = create(:not_hot_post)
				@unpopular_post = create(:not_hot_post)
			end
			@unpopular_post.downvotes.create
		end
		
		it 'they should have the same score' do 
			expect @not_hot_post == @unpopular_post
		end

	end


end