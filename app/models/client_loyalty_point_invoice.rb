class ClientLoyaltyPointInvoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :invoice
end
