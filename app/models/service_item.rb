class ServiceItem < ActiveRecord::Base

  belongs_to :category

  has_one   :invoice_detail

  def service_name
    item
  end

  def to_select2
    { id: id, text: item, price: price }
  end

end
