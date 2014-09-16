class Position < ActiveRecord::Base
  belongs_to :employee

  def position_title
    title
  end
end
