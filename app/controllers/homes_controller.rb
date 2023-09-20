class HomesController < ApplicationController
  def top
    keyword = "Rails"
    @items = RakutenWebService::Ichiba::Item.search(keyword:  keyword)
  end

  def search
    keyword = params[:keyword]
    if keyword.size < 2
      flash[:notice] = "2文字以上入力してください"
      keyword = "Rails"
      @items = RakutenWebService::Ichiba::Item.search(keyword:  keyword)
      render 'top'
    else
      @items = RakutenWebService::Ichiba::Item.search(keyword:  keyword)
      # render json: { items: @items }
      render 'top'
    end
  end

end
