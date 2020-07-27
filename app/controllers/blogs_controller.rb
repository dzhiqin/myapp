class BlogsController < ApplicationController
  layout 'application'
  def index
    @blogs = Blog.where(is_publish: true)
    tag_id = params[:tag_id]
    if tag_id.present?
      @blogs = @blogs.joins(:blog_tags).where('blog_tags.tag_id = ?', tag_id.to_i)
    end
  end

  def new
    @blog = Blog.new()
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def show
    @blog = Blog.find_by(id: params[:id])
  end

  def edit
    @tags = Tag.all
    @blog = Blog.find_by(id: params[:id])
  end

  def update
    @blog = Blog.find_by(id: params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find_by(id: params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "已删除"
  end

  def add_tag
    # redirect_to blogs_path, notice: "已删除"
    blog = Blog.find_by(id: params[:id])
    tag_id = params[:format]
    existed_tags = blog.tags.ids
    if existed_tags.include?(tag_id.to_i)
      flash.now[:notice]="已添加"
    else
      BlogTag.create(blog_id: params[:id], tag_id: params[:format])
      redirect_to blog_path(blog)
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:content, :user_id, :title)
  end
end
