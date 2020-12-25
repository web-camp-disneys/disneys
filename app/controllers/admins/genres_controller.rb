class Admins::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
    redirect_to admins_genres_path,flash:{notice:'新規ジャンルを登録しました。'}
    else
      @genres = Genre.all
      render "index"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    redirect_to admins_genres_path,flash:{notice:'ジャンルを編集しました。'}
    else
      render "edit"
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
end
