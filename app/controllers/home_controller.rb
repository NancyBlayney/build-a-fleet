class HomeController < ApplicationController
	
	def index
		if current_user
			flash[:notice] = "Signed in"
		else
			flash[:notice] = "not signed in"
		end
	end

end
