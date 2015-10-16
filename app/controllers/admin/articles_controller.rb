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
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_article_path(@article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to admin_article_path(@article), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @article
      @article.destroy
      respond_to do |format|
        format.html { redirect_to  admin_articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
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
