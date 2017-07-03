class PostsController < ApplicationController

  def index
    @posts = Post.order("id DESC").all     # 新貼文放前面
  end
  
end
