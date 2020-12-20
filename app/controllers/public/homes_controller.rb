class Public::HomesController < ApplicationController
  def top
    @items = Item.where(is_active: false)
    @genres = Genre.where(is_active: true)
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
    end
  end
end
