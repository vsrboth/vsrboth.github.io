class MembershipScoringCondition < ActiveRecord::Base

  OPERATORS = [ 'between', 'less than', 'greater than' ]
end
