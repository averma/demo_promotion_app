class BusinessesController < ApplicationController

  def new
    @business = Business.new
  end

  def create        
    unless Business.create(:name => params[:bname])
      render :json => {:success => false, :message => "Business Not Created."}
    else     
      render :json => {:success => true, :message => "Business Created."}
    end
  end
end
