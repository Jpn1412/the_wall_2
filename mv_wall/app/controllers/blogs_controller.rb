class BlogsController < ApplicationController
  def index
    if session[:user].nil? || session[:user].empty?
      redirect_to '/login'
    else
      get_messages_comments
      @user = session[:user]
    end
  end

  def get_messages_comments
    @data = Blog.get_all_messages_comments
  end

  def logout
    session.clear
    redirect_to '/login'
  end
end
