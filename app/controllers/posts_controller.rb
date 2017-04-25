class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_path, notice: "投稿OK！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      redirect_to posts_path, notice: "編集OK！"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削減OK!"
  end

private
  def posts_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
