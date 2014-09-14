class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @user = User.new(params[:user])
    @link = Link.new(params[:link])
    @vote = Vote.new(params[:vote])
    # @vote =
  end
