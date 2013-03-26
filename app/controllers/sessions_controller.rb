class SessionsController < ApplicationController
  def new
	end

	def create
	  user = User.authenticate(params[:email], params[:password])
	  if user
	    session[:user_id] = user.id
	    if session[:return_to]
	    	redirect_to session[:return_to], :notice => "Logged in!"
	    else
	    	redirect_to admin_path, :notice => "Logged in!"
	  	end
	  else
	    flash.now.alert = "Invalid email or password"
	    render "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end
end
