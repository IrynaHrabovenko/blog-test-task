class PostsController < ApplicationController
  before_action :get_category
  before_action :find_post, only: %i[ show destroy ]

  def index
    @posts = @category.posts
  end

  def show
  end

  def new
    @post = @category.posts.build
    @title = Posts::AttributesGenerator.new.call(params)[0]
    @post.title = @title
  end

  def create
    @post = @category.posts.build(post_params)
    if @post.save
      redirect_to category_posts_path(@category)
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def destroy
    @post.destroy
    redirect_to category_posts_path(@category)
  end

  private

  def get_category
    @category = Category.find_by(id: params[:category_id])
  end

  def find_post
    @post = @category.posts.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :shared_url, :category_id)
  end
end
