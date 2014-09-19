class CommentsController < ApplicationController
  def index
    @link = Link.find(params[:link_id])
    @comment = Comment.new({link_id: params[:link_id]})
    @comments = @link.comments
    render 'index'
  end

  def new
    @link = Link.find(params[:link_id])
    @comment = Comment.new
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = current_user.comments.new(comment_params)
    @comments = @link.comments
    if @comment.save
      flash[:notice] = "Comment Created"
      redirect_to("/links/#{@link.id}/comments")
    else
      render('index')
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
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

private

  def comment_params
    params.require(:comment).permit(:content, :link_id)
  end
end
