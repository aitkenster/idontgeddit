require 'rails_helper'

describe 'controversial ranking system' do 

	context 'when a post has no upvotes or no downvotes' do

		before(:each) do 
			@popular_post = create(:post)
			@unpopular_post = create(:post)
			10.times{@popular_post.upvotes.create} 
			10.times{@unpopular_post.downvotes.create} 
		end 
		it 'should have a ranking of 0' do 
			expect(@popular_post.controversial_ranking).to equal 0
			expect(@unpopular_post.controversial_ranking).to equal 0
		end
	end

	context 'when a post has a high number of downvotes and upvotes' do 
		before(:each) do 
			@controversial_post = create(:post)
			10.times{@controversial_post.upvotes.create}
			7.times{@controversial_post.downvotes.create}
			@uncontroversial_post = create(:post)
		end
 
		it 'should be ranked more highly than one with a high number of upvotes and a low number of downvotes' do 
			10.times{@uncontroversial_post.upvotes.create}
			3.times{@uncontroversial_post.downvotes.create}
			expect(@controversial_post.controversial_ranking).to be > @uncontroversial_post.controversial_ranking
		end

		it 'should be ranked more highly than one with a high number of downvotes and a low number of upvotes' do 
			3.times{@uncontroversial_post.upvotes.create}
			10.times{@uncontroversial_post.downvotes.create}
			expect(@controversial_post.controversial_ranking).to be > @uncontroversial_post.controversial_ranking
		end
	end
end


