class ArticlesController < ApplicationController
    def index
      @articles = Article.all                        # grab all articles
    end
    def new
      @article = Article.new
    end
    def create
        #render plain: params[:article].inspect      # show the values with param hash

        @article = Article.new(article_params)
        if @article.save                             # This action first validates the values entered 
            flash[:notice] = "Article created successfully"
            redirect_to article_path(@article)       # this is show path
        else
            render 'new'                             # if not valid go back to fill form again.
        end
    end
    def show
        
        @article = Article.find(params[:id])         # find article with param id and show user

    end
    def edit

        @article = Article.find(params[:id])
    end
    def update

        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Artilce was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    private
       def article_params                             # this method whitelist the values.
         params.require(:article).permit(:title, :description)
       end

end