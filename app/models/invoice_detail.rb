class InvoiceDetail < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :employee
  belongs_to :service_item
end
