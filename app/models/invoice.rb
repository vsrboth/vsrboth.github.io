class Invoice < ActiveRecord::Base

  attr_reader :total

  ## Relations
  belongs_to              :client
  has_many                :invoice_details

  delegate :client_id, to: :client

  ## Scopes
  scope :unpaid, -> { where(status: 'unpaid') }

end
