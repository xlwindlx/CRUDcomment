class HomeController < ApplicationController
  before_action :require_login
   def index
    @posts = Post.all
   end

  def create
  end
  
  def new
    @post = Post.new
    @post.title = params[:satang]
    @post.content = params[:kimbab]
    
    fileup = params[:pic]
    uploader = CruduploaderUploader.new
    uploader.store!(fileup)
    @post.image_url = uploader
    flash[:notice] = "전송되었습니다!"
    @post.user = current_user
    if @post.save
      redirect_to "/home/index"
    else
      render :text => @post.errors.messages[:title].first
    end
  end
  
  def read
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
  end
  
  def edit
    post = Post.find(params[:post_id])
    post.title = params[:satang]
    post.content = params[:kimbab]
    if post.save
      redirect_to "/home/index"
    else
      render :text => post.errors.messages[:title].first
    end
  end
  
  def delete
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to "/home/index"
  end
  
  def comment
    comment = Comment.new
    comment.content = params[:comment_id]
    comment.post_id = params[:comment_hidden]
    comment.user = current_user
    if comment.save
      redirect_to "/home/read/#{comment.post.id}"
    else
      render :text => comment.errors.messages[:content].first
    end
  end
  
  def comment_delete
    comment = Comment.find(params[:comment_id])
    comment.destroy
    redirect_to "/home/read/#{comment.post.id}"
  end
 
end
