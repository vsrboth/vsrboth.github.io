class Survey < ActiveRecord::Base
  belongs_to :client
  belongs_to :questionnaire
end
