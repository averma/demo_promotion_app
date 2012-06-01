class PromotionsController < ApplicationController

  autocomplete :promotion, :name

  def new
    if params[:promotion_id]
      @promotion = Promotion.find(params[:promotion_id])
      @promotion_businesses = @promotion.businesses
    else
      @promotion = Promotion.new
    end
    @businesses = Business.all
  end

  ## creates a new promotion
  def create
    if params[:promotion_id]
      @promotion = Promotion.find(params[:promotion_id])
      begin
        @promotion.transaction do
          @promotion.update_attributes!(params[:promotion])
          @promotion.promotion_details.first.update_attributes!(:business_id => params[:business1], :product_id => params[:product1][:id])
          @promotion.promotion_details.last.update_attributes!(:business_id => params[:business2], :product_id => params[:product2][:id])
        end
        flash[:notice] = "Successfully updated"
      rescue Exception => e
        flash[:error] = e.message
      end
    else
      begin
        Promotion.transaction do
          @promotion = Promotion.create!(params[:promotion])
          @promotion.promotion_details.create!(:business_id => params[:business1], :product_id => params[:product1])
          @promotion.promotion_details.create!(:business_id => params[:business2], :product_id => params[:product2])
        end
        flash[:notice] = "Successfully created"
      rescue Exception => e
        flash[:error] = e.message
      end
    end
    redirect_to root_path(:promotion_id => @promotion.id)
  end

  def show_products   
    @products = Product.where("business_id = ?",params[:b_id])
    respond_to do | format |
      format.js { render :show_product }
    end
  end

  def edit_promotion
    @promotion = Promotion.where(:name => params[:pname]).first
    @promotion_businesses = @promotion.businesses
    @businesses = Business.all
    render :partial => "promotion_form", :locals => { :promotion => @promotion, :businesses => @businesses, :promotion_businesses => @promotion_businesses}
  end
end
