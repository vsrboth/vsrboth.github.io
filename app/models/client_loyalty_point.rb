class ClientLoyaltyPoint < ActiveRecord::Base

  belongs_to   :client

  def self.add_point(client_id, invoice_id)
    client = Client.find(client_id)
    point = get_point(invoice_id)
    loyalty_point = client.client_loyalty_point

    if loyalty_point
      total_point = loyalty_point.point + point
      loyalty_point.update_attributes!(point: total_point)
    else
      loyalty_point = client.build_client_loyalty_point(point: point)
      loyalty_point.save!
    end
  end

  def self.subtract_point(client_id, invoice_id)
    client = Client.find(client_id)
    loyalty_point = client.client_loyalty_point
    total_point = loyalty_point.point - 15

    loyalty_point.update_attributes!(point: total_point)
  end

  private
    def get_total_price(invoice_id)
      invoice = Invoice.find(invoice_id)
      total_price = invoice.invoice_details.sum(:new_price)
      total_price
    end

    def get_point(invoice_id)
      total_price = get_total_price(invoice_id)
      point = 0
      MembershipScoringCondition.all.map { |condition|
        if condition.operator.eql? "between"
          if total_price >= condition.first_operand && total_price <= condition.second_operand
            point = condition.score
            break
          end
        elsif condition.operator.eql? "greater than"
          if total_price > condition.first_operand
            point = condition.score
            break
          end
        elsif condition.operator.eql? "less than"
          if total_price < condition.first_operand
            point = condition.score
            break
          end
        end
      }
      point
    end
end
