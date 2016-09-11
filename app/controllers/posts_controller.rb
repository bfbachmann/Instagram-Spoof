class PostsController < ApplicationController
	def index
		@posts = Post.all.reorder "updated_at DESC"
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@posts = Post.all.reorder "updated_at DESC"

		if @post.save
			@notice =  "Your post has been created!"
			render "index"
		else
			@alert = "Your post could not be created."
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
		@posts = Post.all.reorder "updated_at DESC"
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		@posts = Post.all.reorder "updated_at DESC"
		
		if @post.save
			@notice = "Your post has been updated!"
			render 'index'
		else
			@alert = "Your post could not be updated!"
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@posts = Post.all.reorder "updated_at DESC"
		@post.destroy
		@notice = "Your post has been deleted."
		render "index"
	end


	private

	def post_params
		params.require(:post).permit(:image, :caption)
	end
end
