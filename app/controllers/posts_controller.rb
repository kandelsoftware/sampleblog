class PostsController < ApplicationController
  before_action :set_post ,except:[:index,:new]
  def index
   @posts=Post.all
  end
  def show
  end
  def new
    @post=Post.new
  end
  def create
    @post= Post.new(post_params)
   if @post.save
    redirect_to  @post
    else
    render :new
  end
  end
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post is updated"
    else
    end
   end
  def destroy
    @post.destroy
  end

  private

  def set_post
    @post=Post.find(params[:id])  
  end
  def post_params
     params.require(:post).permit(:title,:body)
  end
end
