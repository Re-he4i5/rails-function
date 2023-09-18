class HomesController < ApplicationController
  def top
    keyword = params[:keyword]
    
    @items = RakutenWebService::Ichiba::Item.search(keyword:  keyword)
    # render json: { items: @items }
  end 
end
