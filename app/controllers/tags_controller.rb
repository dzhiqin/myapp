class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new()
  end

  def create
    @tag = Tag.create(tag_params)
    @tag.save
    redirect_to new_tag_path
  end

  def destroy
    @tag = Tag.find_by(id: params[:id])
    @tag.destroy
    redirect_to tags_path, notice: '标签已删除'
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
