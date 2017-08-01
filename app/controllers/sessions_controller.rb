class SessionsController < ApplicationController

	def welcome
	end

	def new
	end

	def create
		code = params[:code]
		url = "https://slack.com/api/oauth.access?client_id=#{ENV['SLACK_KEY']}&client_secret=#{ENV['SLACK_SECRET']}&code=#{code}&redirect_uri=http://localhost:3000/slack/auth"
		request = RestClient.get(url)
 		parse = JSON.parse(request)
		username = parse["user"]["name"]
		@user = User.find_or_create_by(username: username)
		if username.present?
			session[:user_id] = @user.id
			redirect_to posts_path
		else
			flash[:message] = "Slack error"
			redirect_to signin_path
		end
	end

	def destroy
		session.clear
		redirect_to welcome_path
	end



end
