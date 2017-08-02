class ReservationsController < ApplicationController

	def create
		@offer = Offer.find_by(id: params[:offer_id])
		@post = @offer.post
		@student = @post.student
		@tutor = @offer.tutor


		@reservation = Reservation.new(time: DateTime.parse(params[:reservation][:time]), post: @post, student: @student, tutor: @tutor)


		if @reservation.save
			flash[:message] = "Successfully made reservation!"
			@post.status = "reserved"
			@post.save
			redirect_to posts_path
		else
			flash[:message] = @reservation.errors.values.flatten.join("\n")
			redirect_to post_path(@post)
		end
	end

	def destroy
		post = Reservation.find(params[:id]).post
		post.status = "open"
		post.save
		Reservation.destroy(params[:id])

		flash[:message] = "Reservation cancelled!"
		redirect_to posts_path
	end
end
