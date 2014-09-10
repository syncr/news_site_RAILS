class CommentsController < ApplicationController
  def index
    @link = Link.find(params[:link_id])
    @comment = Comment.new({link_id: params[:link_id]})
    @comments = Comment.where("link_id = ?", params[:link_id])
    render 'index'
  end

  def new
    @link = Link.find(params[:link_id])
    @comment = Comment.new
  end

  def create
    @user = User.new(params[:user])
    @link = Link.find(params[:link_id])
    @comment = Comment.new({params[:comment]})
    if @comment.save
      flash[:notice] = "Comment Created"
      redirect_to("/links/#{@link.id}/comments")
    else
      render('index')
    end
  end
end
