class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    return if @post.save

    render :new
  end

  def destroy
    @delete = Post.all
    if @delete.destroy_all
      redirect_to new_posts_path
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
end
