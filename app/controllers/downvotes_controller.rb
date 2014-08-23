class DownvotesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@post.downvotes.create
		redirect_to '/posts'
	end

end
