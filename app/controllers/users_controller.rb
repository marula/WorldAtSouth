class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
    @user.admin = false
  	if @user.save
      session[:user_id] = @user.id
  		redirect_to root_url, :notice => "Signed Up!"
  	else
  		render "new"
  	end			
  end	

  def index
    @users = User.find(:all, :order => "id asc")
    rescue ActiveResource::ResourceNotFound
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "User updated."
    else
      flash.now.alert = "There was a problem updating the user."
      render "edit"
    end
  end

  def destroy
    if User.exists?(params[:id])
      if @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, :notice => "User deleted." 
      end  
    else
      redirect_to users_path, :notice => "User not found." 
    end  
  end
end
