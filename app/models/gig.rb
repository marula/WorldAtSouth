class Gig < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name, :time, :url

  validates_presence_of :date 
  validates_presence_of :description   
  validates_presence_of :location 
  validates_presence_of :name 
  validates_presence_of :time 
  validates_length_of :name, :maximum => 15 
  validates_length_of :location, :maximum => 20 
  validates_length_of :description, :maximum => 60  
end
