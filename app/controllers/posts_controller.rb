class PostsController < ApplicationController
before_action :authenticate_user!

	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post = Post.create(post_params)
			flash[:success] = "Your post has been created."
			redirect_to posts_path
		else
			flash[:alert] = "Halt, you fiend! You need an image to post here!"
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			flash[:success] = "Post updated hombre"
			redirect_to(post_path(@post))
		else
			flash.now[:alert] = "Something is wrong with your form!"
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:success] = "Problem solved! Post deleted."
		redirect_to(posts_path)
	end

	private

	def post_params
		params.require(:post).permit(:caption, :image, :user_id)
	end
end
