class Admin::ArticlesController < Admin::AdminController
  before_action :set_admin_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.order(:date)
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

  private
    def set_admin_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text, :evidence, :visible, :date, :commentable, :tag, :user_id, :slug, :use_slug, { category_ids: [] }, :current_user, :summary, :article_images_attributes [:id, :image])
    end

end
