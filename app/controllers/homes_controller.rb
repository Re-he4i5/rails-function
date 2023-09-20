class HomesController < ApplicationController
  def top
    @items = RakutenWebService::Ichiba::Item.search(keyword: "Rails")
    render json: {items: @items}
  end

  def search
    keyword = params[:keyword]
    if keyword.size < 2
      flash[:notice] = "2文字以上入力してください"
      @items = RakutenWebService::Ichiba::Item.search(keyword: "Rails")
      render 'top'
    else
      @items = RakutenWebService::Ichiba::Item.search(keyword: keyword)
      render 'top'
    end
  end

end
