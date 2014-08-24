class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :text))
		@post.save
		redirect_to '/posts'
	end

	def show
		@post = Post.find(params[:id])
		@comment = @post.comments.new
	end

	def hot
		@posts = Post.all.sort_by{|post|post.hot_ranking}
	end

	def controversial
		@posts = Post.all.sort_by{|post|post.controversial_ranking}
	end

end
