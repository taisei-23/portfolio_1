class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :check_post_owner, only: [ :edit, :update, :destroy ]

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
  end

  def update
    unless @post&.persisted?
      redirect_to posts_path, alert: "投稿が見つかりません"
      return
    end

    begin
      if @post.update(post_params)
        redirect_to posts_path, notice: "更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
    rescue => e
      redirect_to posts_path, alert: "更新中にエラーが発生しました"
    end
  end

  def destroy
    begin
      @post.destroy
      redirect_to posts_path, notice: "削除しました", status: :see_other
    rescue => e
      redirect_to posts_path
    end
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

  def set_post
    @post = Post.find_by(id: params[:id])
    unless @post
      Rails.logger.error "Post not found with id: #{params[:id]}"
      redirect_to posts_path, alert: "投稿が見つかりません"
      nil
    end
  end

  def check_post_owner
    unless @post&.user == current_user
      redirect_to posts_path, alert: "権限がありません"
      nil
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
