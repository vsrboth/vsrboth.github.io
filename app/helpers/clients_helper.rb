module ClientsHelper

  def display_as_birthday(birthdate)
    Date.parse(birthdate).strftime('%d-%b-%Y')
  end

end
