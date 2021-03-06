class SearchController < ApplicationController

	def search
		@user = current_user
		if(current_user.usertype == 0)
			@teenager = Teenager.find_by_user_id(@user.id)
			if(@teenager.latitude == nil || @teenager.longitude == nil)
				redirect_to edit_user_teenager_path(@user.id, @teenager)
			else
				job_search_teen
			end
		elsif(current_user.usertype == 1)
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	private 

	def job_search_teen

		# Find the teen's address
		@current_user = current_user
		@user = current_user		
		@teen = Teenager.find_by_user_id(@current_user.id)
        @lat = @teen.latitude
        @lng = @teen.longitude

        # Find the clients near the teen
        @clients = Client.near([@lat, @lng], 5, :units => :km, order: '')

        # Find the jobs that are near the teen
		@job_types = JobType.where("name LIKE ?", "%#{params[:q]}%")
		@jobs = Job.where("job_type_id IN (?) AND client_id IN (?) AND accepted = ? AND cancelled = ? AND 
			finished = ?", @job_types.ids, @clients.ids, false, false, false)
	end

	def user_search

	end
end
