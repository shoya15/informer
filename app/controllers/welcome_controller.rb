class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def home; end

  def about; end

  def contact; end

  def complete; end
end
