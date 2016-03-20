class HomeController < ApplicationController
	
	def index
		if current_user
			@user = current_user
			@boats = @user.boats
		else
			redirect_to '/users/sign_in'
		end
	end

end
