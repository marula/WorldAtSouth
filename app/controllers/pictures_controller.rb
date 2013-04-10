class PicturesController < ApplicationController
  before_filter :require_admin, :only => [:new, :create, :admin, :edit, :update, :destroy]

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.build
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.create(params[:picture])
    if @picture.save
      redirect_to edit_gallery_path(params[:gallery_id]), :notice => "New picture added."
    else
      flash.now.alert = "Invalid details."
      render "new"
    end     
  end 

  def index
    @pictures = Picture.where(:gallery_id => params[:gallery_id])
    rescue ActiveResource::ResourceNotFound
  end

  def admin
    @pictures = Picture.where(:gallery_id => params[:gallery_id])
    rescue ActiveResource::ResourceNotFound
  end

  def show
    @picture = Picture.find(params[:id])
    respond_to do |format|
      format.json
    end
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(params[:picture])
      redirect_to edit_gallery_path(params[:gallery_id]), :notice => "Picture updated."
    else
      flash.now.alert = "There was a problem updating the picture."
      render "edit"
    end
  end

  def destroy
    if Picture.exists?(params[:id])
      if @picture = Picture.find(params[:id])
        @picture.destroy
        redirect_to edit_gallery_path(params[:gallery_id]), :notice => "Picture deleted." 
      end  
    else
      redirect_to edit_gallery_path(params[:gallery_id]), :notice => "Picture not found." 
    end  
  end
end
