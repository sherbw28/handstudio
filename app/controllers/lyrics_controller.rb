class LyricsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_lyric, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @lyrics = Lyric.order(id: :desc).page(params[:page]).per(3)
  end

  def show
    @lyric = Lyric.find(params[:id])
  end

  def new
    @lyric = current_user.lyrics.build
  end

  def create
    @lyric = current_user.lyrics.build(lyric_params)
    
    if @lyric.save
      flash[:success] = "投稿を完了しました"
      redirect_to @lyric
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    
    if @lyric.update(lyric_params)
      flash[:success] = "編集しました"
      redirect_to @lyric
    else
      flash[:danger] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @lyric.destroy
    
    flash[:success] = "リリックを削除しました"
    redirect_to root_path
  end
  
  private
  
  def set_lyric
    @lyric = current_user.lyrics.find_by(id: params[:id])
  end
  
  def lyric_params
    params.require(:lyric).permit(:title, :content, :meaning)
  end
  
  def correct_user
    @lyric = current_user.lyrics.find_by(id: params[:id])
    unless @lyric
      flash[:danger] = "あなたの投稿のみ編集できます"
      redirect_back(fallback_location: root_path)
    end
  end
end