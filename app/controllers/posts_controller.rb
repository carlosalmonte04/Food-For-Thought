class PostsController < ApplicationController

	STOCK_PHOTOS = [
		"stock_photo1.jpg",
		"stock_photo2.jpg",
		"stock_photo3.jpg",
		"stock_photo4.jpg",
		"stock_photo5.jpg",
		"stock_photo6.jpg",
		"stock_photo7.jpg",
		"stock_photo8.jpg",
		"stock_photo9.jpg"
	]

	before_action :require_login

	def index
		@posts = Post.all
		@user = User.find(session[:user_id])
		@topics = Topic.all.to_a
		@topics.unshift(Topic.new(name: "All"))

	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.student = User.find(session[:user_id])

		if @post.picture_path.blank?
			@post.picture_path = STOCK_PHOTOS.sample
		end
		@post.save
		redirect_to post_path(@post)
	end

	def filter
		@topics = Topic.all.to_a
		@topics.unshift(Topic.new(name: "All"))
		@posts = Post.where(topic_id: Topic.find_by(name: params["topics"]))
		@posts = Post.all if params["topics"] == "All"
		render :index
	end

	def show
		@post = Post.find(params[:id])
	end
	
	def edit
		@post = Post.find_by(id: params[:post_id])
	end

	def update
		@post = Post.find_by(id: params[:id])
		@post.update(post_params)
		redirect_to posts_path(@post)

	end

	# def message_user
	# 	token = "token=xoxp-2727337933-202554058455-220319981716-935148097c1ac783a1e4ee0afc3a08c6&channel=G6G56GYSF"
	# 	base_url = "https://slack.com/api/chat.postMessage?"
	# 	message = params[:message] # message
	# 	channel = 'channel=' + ''# Post.user.slack
	# 	full_request_url = base_url + token + channel + message
	# # request = RestClient.get(url)
 # 	# parse = JSON.parse(request)
	# end

	private

	def post_params
		params.require(:post).permit(:topic, :title, :compensation, :length, :deadline, :description, :picture_path, topic_attributes: [:id])
	end
end




# TODO
# send slack reminder after reservation created
# search for slash commands
# '/remind me in 10 minutes to drink a glass of water'
#
#
# SEND INVITATION SEACH MENU BUTTONS
# {
#     "text": "Hey! Name_of_tutor would like to be your tutor.",
#     "attachments": [
#         {
#             "text": "Choose a game to play",
#             "fallback": "You are unable to choose a game",
#             "callback_id": "wopr_game",
#             "color": "#3AA3E3",
#             "attachment_type": "default",
#             "actions": [
#                 {
#                     "name": "accept_request",
#                     "text": "Accept",
#                     "type": "button",
# 					"style": "primary",
#                     "value": "accepted"
#                 },
#                 {
#                     "name": "deny_request",
#                     "text": "Deny",
#                     "style": "danger",
#                     "type": "button",
#                     "value": "denied",
#                     "confirm": {
#                         "title": "Are you sure?",
#                         "text": "Wouldn't you prefer a good game of chess?",
#                         "ok_text": "Yes",
#                         "dismiss_text": "No"
#                     }
#                 },
# 				                {
#                     "name": "review_request",
#                     "text": "Review Request",
#                     "type": "button",
#                     "value": "review"
#                 }
#             ]
#         }
#     ]
# }

# CREATE REMINDER
# reminders.add
# reminders.complete
# reminders.delete
