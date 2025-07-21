class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "作成しました"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to @post, alert: "他人の投稿は編集できません"
      return
    end

    if @post.update(post_params)
      redirect_to @post, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "削除しました"
  end

  def search
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user).page(params[:page])
    render :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
