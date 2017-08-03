class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:message] = "You've successfully signed up for Food For Thought!"
			redirect_to posts_path
		else
			flash[:message] = @user.errors[:username].join("\n")
			render :new
		end
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	def edit
		@user = User.find(session[:user_id])
	end

	def update
		@user = User.find(session[:user_id])
		@user.update(user_params)

		redirect_to user_path(@user)
	end

	private
	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :email, :description, :slack_id, :small_picture, :profile_picture)
	end
end
