class LinksController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
    @links = Link.all
  end

  def create
    @links = Link.all
    @link = current_user.links.new(link_params)

    if @link.save
      flash[:notice] = "Link Created"
      redirect_to('/links')
    else
      render('new')
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link =link.find(params[:id])
    if @link.update(link_params)
      flash[:notice]= "Link updated"
      redirect_to('/links/#{link.id}')
    else
      render('edit')
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice]="Link Deleted"
    redirect_to('/links')
  end

private

  def link_params
    params.require(:link).permit(:url, :headline)
  end
end
