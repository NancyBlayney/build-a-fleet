class HomeController < ApplicationController
	
	def index
		if current_user
			@boats = Boat.where(user_id:[:current_user])
		else
			redirect_to '/users/sign_in'
		end
	end

end
