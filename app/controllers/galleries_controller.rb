class GalleriesController < ApplicationController
  before_filter :require_admin, :only => [:new, :create, :admin, :edit, :update, :destroy]

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      redirect_to edit_gallery_path(@gallery.id), :notice => "New gallery added."
    else
      flash.now.alert = "Invalid details."
      render "new"
    end     
  end 

  def index
    @galleries = Gallery.find(:all, :order => "id asc")
    rescue ActiveResource::ResourceNotFound
  end

  def admin
    @galleries = Gallery.find(:all, :order => "id asc")
    rescue ActiveResource::ResourceNotFound
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @pictures = Picture.where(:gallery_id => params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      redirect_to galleries_admin_path, :notice => "Gallery updated."
    else
      flash.now.alert = "There was a problem updating the gallery."
      render "edit"
    end
  end

  def destroy
    if Gallery.exists?(params[:id])
      if @gallery = Gallery.find(params[:id])
        @gallery.destroy
        redirect_to galleries_admin_path, :notice => "Gallery deleted." 
      end  
    else
      redirect_to galleries_admin_path, :notice => "Gallery not found." 
    end  
  end
end

