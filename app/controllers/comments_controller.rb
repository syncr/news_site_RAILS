class CommentsController < ApplicationController
  def index
    @link = Link.find(params[:link_id])
    @comments = Comment.where("link_id = ?", params[:link_id])
  end

  def new
    @comment = Comment.new
  end
end
