class HomesController < ApplicationController
  def top
    if params[:keyword]
      if params[:keyword].size < 2
        flash[:danger] = "検索ワードは2文字以上で入力してください"
        render :top
      else
        items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
        @items_full = []
        items.each do |item|
            @items_full.push(item)        
        end
        if @items_full.present?
          @items = Kaminari.paginate_array(@items_full).page(params[:page])
        end
      end
    else
      @items = []
    end
  end

end
