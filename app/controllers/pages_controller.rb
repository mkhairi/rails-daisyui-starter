class PagesController < ApplicationController
  before_action :set_page, only: %i[edit update destroy]

  def index
    @pages = Page.all
    respond_with(@pages)
  end

  def show
    @page = Page.find(params[:id])
    respond_with(@page)
  rescue ActiveRecord::RecordNotFound
    render params[:id]
  end

  def new
    @page = Page.new
    respond_with(@page)
  end

  def edit; end

  def create
    @page = Page.new(page_params)
    @page.save
    respond_with(@page)
  end

  def update
    @page.update(page_params)
    respond_with(@page)
  end

  def destroy
    @page.destroy!
    respond_with(@page)
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :content, :published, :prefrences, :status)
  end
end
