class PostsController < ApplicationController
  before_action :find_post, only: %i[show destroy]

  # def index
  #   @posts = Post.all
  # end

  # def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to index_path
    else
      render :new
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      redirect_to root_path, alert: '削除できませんでした'
    end
  end

  # ここでしか呼べない
  private

  def post_params
    # postでの取得を許可する値を定義(セキュリティ面から)
    params.require(:post).permit(
      :content, :end_time
    )
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
