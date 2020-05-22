class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # 保存に成功した時の処理
      redirect_to item_path(@comment.item.id), notice: "コメントが投稿されました"
    else
      # 保存に失敗した時の処理
      redirect_to item_path(@comment.item.id), notice: "コメントを入力してください"
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end