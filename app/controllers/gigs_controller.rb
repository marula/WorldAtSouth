class GigsController < ApplicationController
  before_filter :require_admin, :only => [:new, :create, :admin, :edit, :update, :destroy]

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(params[:gig])
    if @gig.save
      redirect_to gigs_admin_path, :notice => "New gig added."
    else
      flash.now.alert = "Invalid details."
      render "new"
    end     
  end 

  def index
    @gigs = Gig.where(['date > ?', Date.yesterday]).order("date asc")
    rescue ActiveResource::ResourceNotFound
  end

  def admin
    @gigs = Gig.find(:all, :order => "date asc")
    rescue ActiveResource::ResourceNotFound
  end

  def edit
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])
    if @gig.update_attributes(params[:gig])
      redirect_to gigs_admin_path, :notice => "Gig updated."
    else
      flash.now.alert = "There was a problem updating the gig."
      render "edit"
    end
  end

  def destroy
    if Gig.exists?(params[:id])
      if @gig = Gig.find(params[:id])
        @gig.destroy
        redirect_to gigs_admin_path, :notice => "Gig deleted." 
      end  
    else
      redirect_to gigs_admin_path, :notice => "Gig not found." 
    end  
  end
end
