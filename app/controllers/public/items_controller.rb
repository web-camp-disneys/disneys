class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: false).page(params[:page]).per(8)
    # 全商品一覧商品数表示用
    @items_for_index = Item.where(is_active: false)
    @genres = Genre.where(is_active: true)
    
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      # ジャンル別商品一覧のページネーション用
      @genres_for_index = @genre.items.all.page(params[:page]).per(8)
    end
  end

  def genre_index
    @items = Item.all.find(params[:id])
  end

  def show
     @items = Item.where(is_active: false)
    @genres = Genre.where(is_active: true)
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
    end
    @item = Item.find(params[:id])

        # 種坂追記12/18 ※モデル名にアンダーバーを使ってもクラス名にアンダーバーはつかない
    @cart_item = CartItem.new
  end



end
