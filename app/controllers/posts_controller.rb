class PostsController < ApplicationController
  before_action :find_post, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.articles.create(article_params)
    if @post.save
      flash[:notice] = "Post created!"
      render :show
    else
      flash.now[:alert] = "Check your inputs, something went wrong!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(find_params)
      flash[:notice] = "Post updated!"
      render :show
    else
      flash.now[:alert] = "Check your fields, something went wrong!"
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:alert] = "Post destroyed!"
    redirect_to posts_path
  end

  def find_params
    params.require(:post).permit(:title, :content)
  end

  private

  def from_author
    @user = User.find(params[:user_id])
  end

  def find_post
    @post = post.find(params[:id])
  end
end
