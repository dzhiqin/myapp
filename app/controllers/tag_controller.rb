class TagController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new()
  end

  def create
    @tag = Tag.create(tag_params)
    @tag.save
  end

  def destroy
    @tag = Tag.find_by(id: params[:id])
    @tag.destroy
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
