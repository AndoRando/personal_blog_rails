class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    render :show
  end
end
