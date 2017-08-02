class OffersController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@user = User.find(session[:user_id])
		@offer = Offer.new
		@offer.post = @post
		@offer.tutor = @user


		if @offer.save
			flash[:message] = "Successfully offered help!"
			redirect_to posts_path
		else
			flash[:message] = @offer.errors[:tutor][0]
			redirect_to post_path(@post)
		end
	end

end
