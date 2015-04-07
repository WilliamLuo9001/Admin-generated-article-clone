class CommentsController < ApplicationController
before_action :set_comment, only: [:edit, :update, :show, :destroy ]

  def index
    @comments = Comment.all
  end

  def edit
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to article_path(@article.id), notice: "Comment Posted"
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to comment_path
    else
      render :edit
    end
  end

  def destroy
  end

   private


   def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :score).merge(user_id: current_user.id).merge(article_id: @article.id)
  end
end
