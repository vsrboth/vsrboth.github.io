class Invoice < ActiveRecord::Base
  belongs_to :client

  has_many :invoice_details

  attr_reader :total
end
