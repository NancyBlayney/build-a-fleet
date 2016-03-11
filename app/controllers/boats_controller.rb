class BoatsController < ApplicationController
	def index
		@boats = Boat.all
	end

	def new
		@boat = Boat.new
	end

	def create
		@boat = Boat.create(boat_params)
			if @boat.save
				flash[:notice] = "Boat added to your fleet"
				redirect_to '/boats'
			else
				flash[:alert] = "There was a problem building your boat"
				render 'new'
			end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def boat_params
		params.require(:boat).permit(:user_id, :name, :capacity, :current_location)
	end
end
