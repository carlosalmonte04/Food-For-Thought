class OffersController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@user = User.find(session[:user_id])
		@offer = Offer.new
		@offer.post = @post
		@offer.tutor = @user


		if @offer.save
			flash[:message] = "Successfully offered help!"
			redirect_to user_path(@user)
		else
			flash[:message] = @offer.errors[:tutor].join("\n")
			redirect_to post_path(@post)
		end
	end

end
