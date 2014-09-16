class Employee < ActiveRecord::Base

  has_one     :position
  has_one     :invoice_detail
  has_one     :employee_attendant

  has_many    :appointments
  has_many    :clients, through: :appointments

  has_many    :communications
  accepts_nested_attributes_for :communications

  has_attached_file :avatar,
                    :styles => { :medium => "300x300>", :small => "139x161>", :thumb => "100x100>" },
                    :default_url => "default_person_small.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def full_name
    "#{first_name} #{last_name}"
  end

  def staff_id
    id
  end

  def position_title
    Position.find(self.position_id).title
  end

  def to_select2
    { id: id, text: full_name}
  end

end
