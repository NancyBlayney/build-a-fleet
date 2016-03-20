class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def get_boat
    Boat.find(params[:id])
  end


  def get_job
    Job.find(params[:id])
  end


end
