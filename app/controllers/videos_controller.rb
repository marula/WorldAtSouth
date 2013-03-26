class VideosController < ApplicationController
  before_filter :require_admin, :only => [:new, :create, :admin, :edit, :update, :destroy]

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params[:video])
    if @video.save
      redirect_to videos_admin_path, :notice => "New video added."
    else
      flash.now.alert = "Invalid details."
      render "new"
    end     
  end 

  def index
    @videos = Video.find(:all, :order => "id asc")
    rescue ActiveResource::ResourceNotFound
  end

  def admin
    @videos = Video.find(:all, :order => "id asc")
    rescue ActiveResource::ResourceNotFound
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      redirect_to videos_admin_path, :notice => "Video updated."
    else
      flash.now.alert = "There was a problem updating the video."
      render "edit"
    end
  end

  def destroy
    if Video.exists?(params[:id])
      if @video = Video.find(params[:id])
        @video.destroy
        redirect_to videos_admin_path, :notice => "Video deleted." 
      end  
    else
      redirect_to videos_admin_path, :notice => "Video not found." 
    end  
  end
end
