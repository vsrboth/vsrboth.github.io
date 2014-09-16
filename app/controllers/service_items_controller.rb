class ServiceItemsController < ApplicationController

  before_action :authenticate_account!

  def index
    @categories = Category.all
    @service_items = ServiceItem.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @service_item = ServiceItem.new
  end

  def create
    @service_item = ServiceItem.new(set_service_item_param)
    if @service_item.save
      redirect_to service_items_path
    else
      render :new
    end
  end

  def edit
    @service_item = ServiceItem.find(params[:id])
  end

  def update
    @service_item = ServiceItem.find(params[:id])
    if @service_item.update_attributes(set_service_item_param)
      redirect_to service_items_path
    else
      render :edit
    end
  end

  def destroy
    @service_item = ServiceItem.find(params[:id])
    if @service_item.destroy
      redirect_to service_items_path
    end
  end

  def filter_by_category
    category = Category.find(params[:q])
    @service_items = category.service_items
    # use ajax here
  end

  private
    def set_service_item_param
      params.require(:service_item).permit(:item, :price)
    end

end
