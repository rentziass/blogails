class Admin::ArticlesController < Admin::AdminController
  before_action :set_admin_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.order(:date)

    if params[:query].present?
      @articles = Article.search(params[:query], page: params[:page])
    else
      @articles = Article.all.page params[:page]
    end
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_user.authored_articles.build(article_params)

    if @article.save
      # redirect_to admin_article_path(@article)
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    if @article
      @article.destroy
      redirect_to admin_articles_url
    end
  end

  def autocomplete
    render json: Article.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

  private

  def set_admin_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :evidence, :visible, :date, :commentable, :tag, :user_id, :slug, :use_slug, { category_ids: [] }, :current_user, :summary, :image, :remove_image)
  end

end
