class ServiceCategoriesController < ApplicationController

  before_action :authenticate_account!

  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @category = Category.new
    @category.service_items.build
  end

  def create
    @category = Category.new(set_category_param)
    if @category.save
      redirect_to service_categories_path
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(set_category_param)
      redirect_to service_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to service_categories_path
    else
      redirect_to service_categories_path
    end
  end

  private
    def set_category_param
      params.require(:category).permit(:name, service_items_attributes: [ :id, :_destroy, :item, :price ])
    end

end
