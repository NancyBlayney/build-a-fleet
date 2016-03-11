class JobsController < ApplicationController
	def index
		@jobs = Jobs.all
	end

	def new
		@job = Job.new
		@boat = Boat.find(params[:id])
	end

	def create
		@boat = Boat.find(params[:boat_id])
		@job = @boat.jobs.new(job_params)
			if @job.save
				flash[:notice] = "Job was created"
				redirect_to '/boats/#{boat.id}'
			else
				flash[:alert] = "There was a problem creating your job"
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

	def job_params
		params.require(:job).permit(:boat_id, :name, :containers_needed, :cargo_description, :origin, :destination, :price)
	end

end
