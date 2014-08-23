require 'spec_helper'

def upvote
	visit '/posts'
	click_link '↑'
end