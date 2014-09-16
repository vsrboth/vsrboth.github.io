class Category < ActiveRecord::Base

  has_many :service_items, dependent: :destroy
  accepts_nested_attributes_for :service_items
end
