class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_comment_user, only: [:destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:info] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @comment = current_user.comments.find_by(id: params[:id])
    @comment.destroy

    flash[:info] = "削除しました"
    redirect_back(fallback_location: root_path)
  end

  private

    def comment_params
      params.require(:comment).permit(:post, :lyric_id)
    end
    
    def correct_comment_user
      @comment = current_user.comments.find_by(id: params[:id])
      unless @comment
        flash[:danger] = "あなたのコメントのみ削除できます"
        redirect_back(fallback_location: root_path)
      end
    end
end
