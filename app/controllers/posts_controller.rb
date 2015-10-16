class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post added"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
