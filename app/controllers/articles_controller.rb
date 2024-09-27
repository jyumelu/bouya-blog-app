class ArticlesController < ApplicationController

    before_action :set_article, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        # render 'articles/index'
        @articles = Article.all
    end

    def show
        @comments = @article.comments
    end

    def new
        @article = current_user.articles.build
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            redirect_to article_path(@article), notice: '保存できたよ'
        else
            flash.now[:error] = '保存に失敗しました'
            render :new
        end
    end

    def edit
        # この書き方以外だとセキュリティ的に問題あり
        # 例
        # @article = Articles.find(params[:id])
        # だと、他人の記事を書き換えれてしまう
        # 外部から他人に操作されてはいけないものは 現在のユーザのみ変更を許す
        @article = current_user.articles.find(params[:id])
    end

    def update
        @article = current_user.articles.find(params[:id])
        if @article.update(article_params)
            redirect_to article_path(@article), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    def destroy
        # @article にしてしまうと、view で表示しているのではとなる (文化的な話)
        article = current_user.articles.find(params[:id])
        article.destroy!
        redirect_to root_path, notice: '削除に成功しました'
    end

    private
    def article_params
        params.require(:article).permit(:title, :content)
    end

    def set_article
        @article = Article.find(params[:id])
    end

end
