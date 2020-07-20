class WelcomeController < ApplicationController
  layout 'index'
  def index
    @blogs = Blog.all
  end
end
