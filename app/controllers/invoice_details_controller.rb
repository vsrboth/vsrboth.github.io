class InvoiceDetailsController < ApplicationController

  def index

  end

  def create
    @invoice_detail = InvoiceDetail.new(invoice_detail_param)
    if @invoice_detail.save
      store_invoice_detail_id
      @invoice_detail_list = InvoiceDetail.where(id: session[:invoice_detail_ids].split(','))
      respond_to do |format|
        format.js
      end
    else
    end
  end

  def destroy
    @invoice_detail = InvoiceDetail.find(params[:id])
    if @invoice_detail.destroy
      remove_invoice_detail_id
      respond_to do |format|
        format.js
      end
    end
  end

  private
    def invoice_detail_param
      params.require(:invoice_detail).permit(:employee_id, :service_item_id, :new_price, :discount_type, :discount_value)
    end

    def store_invoice_detail_id
      session[:invoice_detail_ids] << ",#{@invoice_detail.id}" if session[:invoice_detail_ids]
      session[:invoice_detail_ids] = @invoice_detail.id.to_s if session[:invoice_detail_ids].nil?
    end

    def remove_invoice_detail_id
      invoice_detail_ids = session[:invoice_detail_ids]
      session[:invoice_detail_ids] = invoice_detail_ids.gsub(",#{@invoice_detail.id}", " ")
    end
end
