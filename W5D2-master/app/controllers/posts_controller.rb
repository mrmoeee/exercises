class PostsController < ApplicationController
  def new
  @post = Post.new   
  end

  def create
    #fix 
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.subs.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_url
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end
  
  def post_params 
    #sub_id array
    params.require(:post).permit(:title, :url, :content)
  end
end
