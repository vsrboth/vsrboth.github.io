module InvoicesHelper

  def client_list
    Client.all.map { |client|
      client.full_name
    }
  end

end
