class ArticlesController < ApplicationController
  #los before_action se ejecutan en el orden que se definen
  before_action :set_article, only: [:show, :edit, :destroy, :update] 
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = current_user
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
    @articles= Article.paginate( page: params[:page], per_page: 5 ) 
  end 
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  #se agrega un ajuste para recibir los checkboxes de catgorias como un arreglo
  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end
end