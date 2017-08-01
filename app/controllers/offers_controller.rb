class OffersController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@user = User.find(session[:user_id])
		@offer = Offer.new
		@offer.post = @post
		@offer.tutor = @user
		@offer.save

		redirect_to posts_path
	end

end
