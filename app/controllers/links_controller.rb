class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
    @links = Link.all
  end

  def create
    @user = User.new(params[:user])
    @link = Link.new(params[:link])
    @links = Link.all
    if @link.save
      flash[:notice] = "Link Created"
      redirect_to('/links')
    else
      render('index')
    end
  end

  # def show
  #   @link= Link.find(params[:id])
  # end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link =link.find(params[:id])
    if @link.update(params[:link])
      flash[:notice]= "Link updated"
      redirect_to('/links/#{link.id}')
    else
      render('edit')
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:alert]="Link Deleted"
    redirect_to('/links')
  end

end
