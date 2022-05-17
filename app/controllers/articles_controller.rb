class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit , :update , :show , :destroy]
    def index
      @articles = Article.all                 # grab all articles
    end
    def new
      @article = Article.new
    end
    def create
        #render plain: params[:article].inspect      # show the values with param hash  
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save                             # This action first validates the values entered 
            flash[:success] = "Article created successfully"
            redirect_to article_path(@article)       # this is show path
        else
            render 'new'                             # if not valid go back to fill form again.
        end
    end
    def edit     
    
    end
    def update
        if @article.update(article_params)
            flash[:success] = "Artilce was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    def show
        
    end
    def destroy
        
        @article.destroy
        flash[:danger] = "Article was successfully deleted"
        redirect_to articles_path
    end

    private
       def set_article
         @article = Article.find(params[:id]) 
       end
       def article_params                             # this method whitelist the values.
         params.require(:article).permit(:title, :description)
       end

end