class RatingsController < ApplicationController

	def new
		@tutor = User.find_by(id: params[:button])
		@reservation_id = params[:review][:reservation_id]
	end

	def create
		@rating = Rating.new(value: rating_params[:value], comment: rating_params[:comment])
		@reservation = Reservation.find_by(id: rating_params[:reservation_id])
		@rating.reservation = @reservation
		@tutor = User.find_by(id: rating_params[:tutor_id])

		if @rating.save
			@reservation.update(status: "reviewed")
			flash[:message] = "Successfully submitted rating"
			redirect_to posts_path
		else
			flash[:message] = "Please choose one of the values below"
			render :new
		end
	end

	private

	def rating_params
		params.require(:rating).permit(:value, :comment, :tutor_id, :reservation_id)
	end
end
