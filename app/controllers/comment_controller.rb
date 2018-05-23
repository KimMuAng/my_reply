class CommentController < ApplicationController
  def reply_create
    new_reply = Reply.new
    new_reply.post_id = params[:post_id]
    new_reply.editor = params[:r_editor]
    new_reply.content = params[:r_content]
    new_reply.save

    redirect_to '/show/' + params[:post_id]
  end
  
  def reply_delete
    del_post = Reply.find(params[:reply_id])
    del_post.destroy
    
    show_post_url = "/show/" + params[:post_id]
    redirect_to show_post_url
  end
end
