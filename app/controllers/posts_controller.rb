class PostsController < ApplicationController
	before_action :require_login

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.student = User.find_or_create_by(first_name: "Test", last_name: "Teste" )
		@post.save
		redirect_to post_path(@post)
	end

	def show
		@post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:topic, :title, :compensation, :length, :deadline, :description, topic_attributes: [:id])
	end
end
