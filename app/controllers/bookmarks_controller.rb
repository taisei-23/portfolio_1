class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [ :create, :destroy ]

  def create
    @post = Post.find(params[:post_id])
    current_user.bookmarks.create(post: @post)

    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "ブックマークしました。" }
      format.turbo_stream
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.find_by(post: @post)
    bookmark&.destroy

    respond_to do |format|
      format.html { redirect_to post_path, notice: "ブックマークを解除しました。", status: :see_other }
      format.turbo_stream
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
