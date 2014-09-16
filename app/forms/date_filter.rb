class DateFilter
  include Virtus.model

  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :filtered_date, String

  def query
    return {} if filtered_date.blank?
    {
      filtered_date: get_today_filtered_date
    }
  end

  private
    def get_today_filtered_date
      date = Date.parse(filtered_date)
      date.strftime('%Y-%m-%d')
    end

end