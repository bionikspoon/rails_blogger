class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :set_article, only: [:show, :destroy, :edit, :update]
  before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path @article
  end

  def destroy
    @article.destroy

    flash.notice = "Article '#{@article.title}' Deleted!"
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path @article
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
end
