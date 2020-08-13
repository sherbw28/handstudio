class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order(id: :desc).page(params[:page]).per(5)
    @lyrics = @user.lyrics.order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:info] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    
    if @user.update(user_params_update)
      flash[:success] = "情報が更新されました"
      redirect_to @user
    else
      flash[:danger] = "更新に失敗しました"
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def user_params_update
    params.require(:user).permit(:name, :email, :img, :remove_img)
  end
  
end
