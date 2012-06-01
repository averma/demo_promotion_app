class ProductsController < ApplicationController
  def create
    unless Product.create(:name => params[:pname], :business_id => params[:pbid], :retail_price => params[:r_price], :discounted_price => params[:d_price])
      render :json => {:success => false, :message => "Product Not Created."}
    else
      render :json => {:success => true, :message => "Product Created."}
    end
  end

  def get_product
    @product = Product.find(params[:pid])
    render :json => {:success => true, :rprice => @product.retail_price, :dprice => @product.discounted_price}
  end
  
end
