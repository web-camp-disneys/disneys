class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: false)
    @genres = Genre.where(is_active: true)
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
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
    # @cart_item = CartItem.new
  end
  
  
  
end
