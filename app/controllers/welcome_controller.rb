class WelcomeController < ApplicationController
  def index
  	@comments = Comment.all
  	@article = Article.all.paginate(page: params[:page], per_page: 6) 
  	@user = User.all
  end

  private
 
end
