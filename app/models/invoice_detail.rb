class InvoiceDetail < ActiveRecord::Base
  belongs_to  :invoice
  belongs_to  :employee
  belongs_to  :service_item

  delegate    :full_name, to: :employee
  delegate    :service_name, to: :service_item

  def self.assign_invoice_id(invoice_id, invoice_detail_ids)
    invoice_detail_list = InvoiceDetail.where(id: invoice_detail_ids)
    invoice_detail_list.update_all(invoice_id: invoice_id)
  end

end
