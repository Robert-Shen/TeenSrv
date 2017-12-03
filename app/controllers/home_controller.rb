class HomeController < ApplicationController
	skip_before_action :authenticate_user!,raise: false
	
	def index
		if user_signed_in?
			@user = current_user
		end
	end
end
