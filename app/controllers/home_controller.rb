class HomeController < ApplicationController
  def index
    @view_post = Post.all #실질적인 모델을 불러오는 것은 컨트롤러에서 / 보여지는 것은 뷰에서
  end
  
  def new
  end
  
  def create
    posts = Post.new
    posts.title = params[:title]
    posts.editor = params[:editor]
    posts.content = params[:content]
    
    posts.save
    
    redirect_to '/'
  end
  
  def show #실질적으로 게시글 하나를 보여주기. 
    @s_post = Post.find(params[:post_id]) 
    
    #댓글 나열하기
    Post.find(params[:post_id]).replies.all
  end
  
  def delete
    d_post = Post.find(params[:post_id])
    d_post.destroy
    redirect_to "/"
  end
  
  def edit
    @e_post = Post.find(params[:post_id])
  end

  def update
    u_post = Post.find(params[:post_id])
    u_post.title = params[:title]
    u_post.editor = params[:editor]
    u_post.content = params[:content]
    u_post.save
    
    redirect_to '/show/' + params[:post_id]
  end

end