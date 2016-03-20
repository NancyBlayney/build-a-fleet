class BoatsController < ApplicationController
	def index
		@boats = Boat.all
	end

	def new
		@boat = Boat.new
	end

	def create
		@boat = Boat.create(boat_params)
		@boat.user_id = current_user.id
			if @boat.save
				flash[:notice] = "Boat added to your fleet"
				redirect_to '/boats'
			else
				flash.now[:error] = @boat.errors.full_messages
				render 'new'
			end
	end

	def show
		@boat = get_boat
		@jobs = @boat.jobs
		@job = Job.new
	end

	def edit
		@boat = Boat.find(params[:id])
	end

	def update
		@boat = Boat.update(boat_params)
		if @boat.save
			flash[:notice] = "Changed"
			redirect_to '/boats'
		else
			flash[:notice] = "Not changed"
			render 'new'
		end
	end

	def destroy
		@boat = Boat.find(params[:id])
		if @boat.destroy
			flash[:notice] = "Success"
			redirect_to '/boats'
		else
			flash[:notice] = "Failure"
			redirect_to '/boats'
		end
	end

	private

	def boat_params
		params.require(:boat).permit(:user_id, :name, :capacity, :current_location)
	end
end
