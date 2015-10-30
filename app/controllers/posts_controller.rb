class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]
  before_action :find_tags, only: [:index, :new, :edit]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:tags]
      params[:tags].each do |tag|
        @post.tags << Tag.find_by_name(tag)
      end
    end

    if @post.save
      flash[:notice] = "Post added"
      redirect_to posts_path
    else
      flash[:alert] = "Something happened, please try again."
      render :new
    end
  end

  def edit
  end

  def update
    if params[:tags]
      params[:tags].each do |tag|
        @post.tags << Tag.find_by_name(tag)
      end
    else
      @post.tags.each do |tag|
        @post.tags.delete(tag)
      end
    end

    if @post.update(post_params)
      flash[:notice] = "Post updated"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something happened, please try again."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def find_tags
    @tags = Tag.all
  end
end
