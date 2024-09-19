class ArticlesController < ApplicationController
    def index
        # render 'articles/index'
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end
    
end
   