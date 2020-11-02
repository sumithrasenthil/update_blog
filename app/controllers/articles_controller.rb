class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    
    
    if params[:search].present?
      @articles =Article.where("title ILIKE?", "%#{params[:search][:title]}%")
    else
      @articles = Article.all
    end
    

    
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article =Article.new(article_params)
    
    if @article.save
    
      flash.notice="Article '#{@article.title}' created"
      redirect_to article_path(@article)
    else 
      render 'new'
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article.update(article_params)
    flash.notice ="Article  '#{@article.title}' Updated "
    redirect_to article_path(@article)
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    flash.notice ="Article '#{@article.title}' Deleted"
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :user_id)
    end
end
