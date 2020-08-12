class CommentsController < ApplicationController
  before_action :require_user_logged_in

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
    Comment.find_by(id: params[:id],lyric_id: params[:lyric_id]).destroy

    flash[:info] = "削除しました"
    redirect_back(fallback_location: root_path)
  end

  private

    def comment_params
      params.require(:comment).permit(:post, :lyric_id)
    end
end
