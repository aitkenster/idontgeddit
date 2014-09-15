class PostsController < ApplicationController
	def index
		@posts = Post.all
		redirect_to '/posts/hot'
	end

	def new
		if !user_signed_in?
			flash[:notice] = 'Sign in to post'
			redirect_to '/posts'
		end
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :text, :url))
		@post.user = current_user
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

	def new_link
		@post = Post.new
	end

end
