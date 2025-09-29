class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user)

    set_meta_tags(
      title: "掲示板一覧",
      description: "みんなの投稿を一覧で確認できます。",
      og: {
        title: "掲示板一覧",
        description: "みんなの投稿を一覧で確認できます。",
        image: view_context.image_url("ogp.png"),
        url: request.original_url
      },
      twitter: {
        card: "summary_large_image",
        image: view_context.image_url("ogp.png")
      }
    )
  end

  def autocomplete
    query = params[:q].to_s.strip
    return render json: [] if query.blank?

    @posts = Post.ransack(title_or_body_cont: query).result(distinct: true).limit(5)
    render json: @posts.map { |post| { id: post.id, title: post.title, body: post.body.truncate(100) } }
  end

  def show
    @post = Post.find(params[:id])

    set_meta_tags(
      title:       @post.title,
      description: @post.body.truncate(160),
      og: {
        title:       @post.title,
        description: @post.body.truncate(160),
        type:        "article",
        url:         request.original_url,
        image:       @post.image.attached? ? url_for(@post.image) : view_context.image_url("ogp.png")
      },
      twitter: {
        card:        "summary_large_image",
        title:       @post.title,
        description: @post.body.truncate(160),
        image:       @post.image.attached? ? url_for(@post.image) : view_context.image_url("ogp.png")
      }
    )
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "作成しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new, status: :unprocessable_entity
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
    @posts = @q.result.includes(:user)
    render :index
  end

  def bookmarks
    @bookmarks = current_user.bookmarked_posts.includes(:user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
