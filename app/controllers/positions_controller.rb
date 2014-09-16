class PositionsController < ApplicationController
  before_action :authenticate_account!

  def index
    @positions = Position.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(set_position_param)
    if @position.save
      redirect_to employee_setting_positions_path
    else
      render :new
    end
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])
    if @position.update_attributes(set_position_param)
      redirect_to employee_setting_positions_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def set_position_param
      params.require(:position).permit(:title)
    end
end
