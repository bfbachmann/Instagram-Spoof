class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			@notice = "Your post was created!"
			render 'index'
		else
			@alert = "Failed to create post."
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		
		if @post.save
			@notice = "Your post was updated successfully!"
			render 'index'
		else
			@alert = "Failed to update post."
			render 'edit'
		end
	end


	private

	def post_params
		params.require(:post).permit(:image, :caption)
	end
end
