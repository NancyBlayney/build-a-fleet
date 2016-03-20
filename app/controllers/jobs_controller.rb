class JobsController < ApplicationController
	def index
		@boat = Boat.find(params[:boat_id])
		@jobs = Boat.jobs
	end

	def new
		@boat = Boat.find(params[:boat_id])
		@job = @boat.jobs.build
	end

	def create
		@boat = Boat.find(params[:boat_id])
		@job = @boat.jobs.build(job_params)
			if @job.save
				flash[:notice] = "Job was created"
				redirect_to boat_path(@boat)
			else
				flash.now[:error] = @job.errors.full_messages
				render 'new'
			end
	end

	def show
		@boat = Boat.find(params[:boat_id])
		@job = get_job
	end

	def edit
	end
	
	def update
	end

	def destroy
	end

	private

	def job_params
		params.require(:job).permit(:boat_id, :name, :containers_needed, :cargo_description, :origin, :destination, :price)
	end

end
