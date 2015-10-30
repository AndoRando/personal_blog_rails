class TagsController < ApplicationController
  before_action :find_tag, except: [:new, :create, :index]

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag added"
      redirect_to posts_path
    else
      flash[:alert] = "Something happened, please try again."
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      flash[:notice] = "Tag updated"
      redirect_to posts_path
    else
      flash[:alert] = "Something happened, please try again."
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to posts_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end
end
