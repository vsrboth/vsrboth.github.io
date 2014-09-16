class Communication < ActiveRecord::Base

  belongs_to :client
  belongs_to :employee

  TYPES = [ 'mobile', 'email' ]
end
