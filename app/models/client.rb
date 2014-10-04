class Client < ActiveRecord::Base

  # has_and_belongs_to_many :quetionnaires

  has_one   :client_loyalty_point
  has_many  :client_loyalty_point_invoices
  has_many  :invoices

  has_many  :appointments
  has_many  :employees, through: :appointments

  has_many  :communications, dependent: :destroy
  accepts_nested_attributes_for :communications


  ## Method
  def full_name
    "#{first_name} #{last_name}"
  end

  def client_id
    id
  end

  def to_select2
    { id: id, text: full_name}
  end

end
