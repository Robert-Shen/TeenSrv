class SessionsController < ApplicationController
  def new
  	render 'new'
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
  	if(user && user.authenticate(params[:session][:password]))
  		log_in user
  		redirect_to user_path

  	else
  		flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
  		render 'new'
  	end
  end
  def destroy

  end
end
