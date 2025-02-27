class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Post.published.order("id desc")
      .with_attached_cover
      .includes(user: {avatar_attachment: :blob})
      .page(1).per(7)

    @latest_articles = Post.published.order("id desc")
      .with_attached_cover
      .includes(user: {avatar_attachment: :blob})
      .page(2).per(7)

    @category = Category.friendly.find("news")
    @news = Post.published.friendly.where(category_id: @category)
      .with_attached_cover
      .includes(user: {avatar_attachment: :blob})
      .order("id desc").page(1).per(7)
  end

  def new
    @article = current_user.posts.new
  end

  def show
    @post = Post.published.friendly.find(params[:id])

    set_meta_tags(
      # title: @post.title,
      # description: @post.excerpt,
      keywords: "",
      # url: Routes.articles_show_url(socket, :show, post.id),
      title: "#{@post.title} on Rauversion",
      description: "Read #{@post.title} by #{@post.user.username} on Rauversion.",
      image: @post.cover_url(:small)
    )
  end

  def create
    @article = current_user.posts.create(body: params[:post][:body])
    redirect_to edit_article_path(@article), status: :see_other
  end

  def edit
    @article = current_user.posts.friendly.find(params[:id])
    # redirect_to edit_article_path(@article)
  end

  def update
    @article = current_user.posts.friendly.find(params[:id])
    @article.update(article_params)
    # redirect_to edit_article_path(@article)
    flash.now[:notice] = "aloha!!"
  end

  def mine
    @tab = params[:tab] || "all"
    @posts = case @tab
    when "published"
      current_user.posts.published
    when "draft"
      current_user.posts.draft
    else
      current_user.posts
    end

    @posts.page(params[:page]).per(10)
  end

  private

  def article_params
    params.require(:post).permit(
      :id, :title, :private,
      :cover,
      :category_id, :state, :excerpt, body: {}
    )
  end
end
