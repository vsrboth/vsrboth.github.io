class InvoicesController < ApplicationController
  before_action :authenticate_account!
  before_action :set_invoice_code, only: [:create]

  def index
    @invoices = Invoice.unpaid
  end

  def new
    @invoice = Invoice.new
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def paid_and_print_invoice
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "invoice", # pdf will download as my_pdf.pdf
               :show_as_html => params[:debug].present? # renders html version if you set debug=true in URL
      end
    end
  end

  def apply_point
    @invoice = Invoice.find(params[:id])
    client = Client.find(@invoice.client_id)
    point = client.client_loyalty_point_invoices.new(invoice_id: @invoice.id)
    if point.save
      @invoice.update_attributes(discount: 10)
      apply_point_if_eligible
      respond_to do |format|
        format.js
      end
    end
  end

  def create
    @invoice = Invoice.new(set_invoice_param)
    if @invoice.save
      InvoiceDetail.assign_invoice_id(@invoice.id, session[:invoice_detail_ids].split(','))
      reset_invoice_detail_ids
      redirect_to invoices_path
    else
      render :new
    end
  end

  private

    def reset_invoice_detail_ids
      session[:invoice_detail_ids] = nil
    end

    def set_invoice_param
      params.require(:invoice).permit(:client_id, :deposit, :payment_method, :discount)
            .merge(invoice_code: @invoice_code)
    end

    def set_invoice_code
      invoice = Invoice.last
      @invoice_code = invoice.gsub('BSI', '').to_i + 1
      @invoice_code = '%.6i' % @invoice_code
    end

    def update_loyalty_score
      ClientLoyaltyPoint.add_point(@invoice.client_id, @invoice.id)
    end

    def apply_point_if_eligible
      ClientLoyaltyPoint.subtract_point(@invoice.client_id, @invoice.id)
    end

end
