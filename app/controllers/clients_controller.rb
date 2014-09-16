class ClientsController < ApplicationController
  before_action :authenticate_account!

  before_action :current_client, only: [:edit, :update]

  def index
    @clients = Client.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @client = Client.new
    @client.communications.build
  end

  def create
    @client = Client.new(set_client_param)
    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @client.update_attributes(set_client_param)
      redirect_to client_path
    else
      render :edit
    end
  end

  private
    def set_client_param
      params.require(:client)
        .permit(:title, :first_name, :last_name, :gender, :birth_date, :occupation, :address, :remark, communications_attributes: [ :id, :_destroy, :field, :value ])
    end

    def current_client
      @client = Client.find(params[:id])
    end

end
