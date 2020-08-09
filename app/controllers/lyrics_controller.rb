class LyricsController < ApplicationController
  before_action :set_lyric, only: [:show, :edit, :update, :destroy]
  
  def index
    @lyrics = Lyric.order(id: :desc).page(params[:page]).per(3)
  end

  def show
  end

  def new
    @lyric = Lyric.new
  end

  def create
    @lyric = Lyric.new(lyric_params)
    
    if @lyric.save
      flash[:success] = 'Lyric が正常に投稿されました'
      redirect_to @lyric
    else
      flash.now[:danger] = 'Lyric が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    
    if @lyric.update(lyric_params)
      flash[:success] = 'Lyric が正常に投稿されました'
      redirect_to @lyric
    else
      flash.now[:danger] = 'Lyric が投稿されませんでした'
      render :edit
    end
  end

  def destroy
    @lyric.destroy
    
    flash[:success] = 'Lyric は正常に削除されました'
    redirect_to lyrics_url
  end
  
  private
  def set_lyric
    @lyric = Lyric.find(params[:id])
  end
  
  def lyric_params
    params.require(:lyric).permit(:title, :content, :meaning)
  end
  
end
