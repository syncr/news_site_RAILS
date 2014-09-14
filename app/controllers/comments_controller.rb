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
    @comment = Comment.new(params[:comment])
    @comments = Comment.all
    if @comment.save
      flash[:notice] = "Comment Created"
      redirect_to("/links/#{@link.id}/comments")
    else
      render('index')
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params[:comment])
      flash[:notice] = "Comment Updated"
      redirect_to comment_path(@comment)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted"
    redirect_to comments_path
  end
end
