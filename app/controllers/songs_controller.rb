class SongsController < ApplicationController
  before_filter :require_admin, :only => [:new, :create, :admin, :edit, :update, :destroy]

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      redirect_to songs_admin_path, :notice => "New song added."
    else
      flash.now.alert = "Invalid details."
      render "new"
    end     
  end 

  def index
    @songs = Song.find(:all, :order => "id asc")
    rescue ActiveResource::ResourceNotFound
  end

  def admin
    @songs = Song.find(:all, :order => "id asc")
    rescue ActiveResource::ResourceNotFound
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      redirect_to songs_admin_path, :notice => "Song updated."
    else
      flash.now.alert = "There was a problem updating the song."
      render "edit"
    end
  end

  def destroy
    if Song.exists?(params[:id])
      if @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_admin_path, :notice => "Song deleted." 
      end  
    else
      redirect_to songs_admin_path, :notice => "Song not found." 
    end  
  end
end
