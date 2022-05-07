class Kudo < ApplicationRecord
  belongs_to :giver, class_name: 'Employee'
  belongs_to :receiver, class_name:'Employee'
  after_destroy :increashing_available_kudos
  after_save :decrashing_available_kudos
  validates :title, presence: true
  validates :content, presence: true

  validate :number_of_available_kudos_cannot_be_less_than_zero, on: :create




  def decrashing_available_kudos
    Employee.update_counters giver_id, number_of_available_kudos: -1
  end
  def increashing_available_kudos
    Employee.update_counters giver_id, number_of_available_kudos: +1
  end


  def number_of_available_kudos_cannot_be_less_than_zero
    return unless (giver.number_of_available_kudos <= 0)
      errors.add(:number_of_available_kudos, "You can't add more Kudos")
  end
end
