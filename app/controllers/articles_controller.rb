class ArticlesController < ApplicationController
    def index
        # render 'articles/index'
        @article = Article.first
    end
end
   