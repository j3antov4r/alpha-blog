class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy, :update] 
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:success]= "Articulo creado satisfactoriamente"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def edit
    @article= Article.find(params[:id])
  end 
  
  def update
    #@article= Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Artculo actualizado satisfactoriamente"
      redirect_to article_path(@article)
      
    else
      render 'edit'
    end
  end
  
  def show
   # @article = Article.find(params[:id])
  end
  
  def destroy
   # @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Articulo eliminado"
    redirect_to articles_path
  end
  
  def index
    @articles= Article.all  
  end 
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end