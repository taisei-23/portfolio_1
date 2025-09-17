class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [ :create, :destroy, :edit, :update ]
  before_action :set_comment, only: [ :destroy, :edit, :update ]

  def edit
    @editing_comment = @post.comments.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    render "posts/show"
  end

  def update
    unless @comment.user == current_user
      redirect_to @post, alert: "他人のコメントは編集できません"
      return
    end

    if @comment.update(comment_params)
      redirect_to @post, notice: "コメントを更新しました"
    else
      render :edit
    end
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: "コメントを投稿しました"
    else
      redirect_to @post, alert: "エラーが発生しました"
    end
  end

  def destroy
    Rails.logger.debug "Deleting comment with ID: #{params[:id]}"
    if @comment.user == current_user && @comment.destroy
      redirect_to @post, notice: "コメントを削除しました"
    else
      redirect_to @post, alert: "エラーが発生しました"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
