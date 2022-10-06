class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]


  def index
    @posts = Post.limit(10).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to action: :index unless current_user == @post.user
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if user_signed_in? && current_user == post.user
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:body,tag_ids:[]).merge(user_id: current_user.id)
  end
end
