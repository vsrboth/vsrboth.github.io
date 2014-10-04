module InvoicesHelper

  def client_list
    Client.all.map { |client|
      client.full_name
    }
  end

  def current_point(invoice)
    point = 0
    client = Client.find(invoice.client_id)
    point = client.client_loyalty_point.point if client.client_loyalty_point
    point
  end

end
