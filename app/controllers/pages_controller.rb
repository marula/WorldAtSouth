class PagesController < ApplicationController
  before_filter :require_admin, :only => [:admin]
end