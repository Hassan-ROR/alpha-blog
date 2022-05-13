class ArticlesController < ApplicationController

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

    private
       def article_params                             # this method whitelist the values.
         params.require(:article).permit(:title, :description)
       end

end