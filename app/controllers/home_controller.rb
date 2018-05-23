class HomeController < ApplicationController
  def index
    @view_post = Post.all #실질적인 모델을 불러오는 것은 컨트롤러에서 / 보여지는 것은 뷰에서
  end
  
  def write
  end
  
  def create
    posts = Post.new
    posts.title = params[:title]
    posts.editor = params[:editor]
    posts.content = params[:content]
    posts.password = params[:password]
    
    posts.save
    
    redirect_to '/list'
  end
  
  def show #실질적으로 게시글 하나를 보여주기. 
    @s_post = Post.find(params[:post_id]) 
  end
  
  def destroy
    d_post = Post.find(params[:post_id])
    d_post.destroy
    redirect_to "/list"
  end
  
  def edit_show
    @e_post = Post.find(params[:post_id])
  end

  def update
    u_post = Post.find(params[:post_id])
    u_post.title = params[:title]
    u_post.editor = params[:editor]
    u_post.content = params[:content]
    u_post.password = params[:password]
    u_post.save
    
    redirect_to '/list'
  end

end
