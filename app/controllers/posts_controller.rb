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

	def newest
		@posts = Post.all
	end

	def rising
		@posts = Post.all.sort_by{|post|post.rising_ranking}
	end

	def top
		@posts = Post.all.sort_by{|post|post.overall_votes}
	end

end
