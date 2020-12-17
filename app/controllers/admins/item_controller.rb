class Admins::ItemController < ApplicationController
  def new
    @item = Item.new(item_params)
  end

  def show
  end

  def edit
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :)
  end
  
end
