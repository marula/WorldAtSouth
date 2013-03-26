class Song < ActiveRecord::Base
  attr_accessible :name, :url  

  validates_presence_of :name 
  validates_presence_of :url 
  validates_uniqueness_of :name
  validates_uniqueness_of :url
end
