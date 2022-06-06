class Kudo < ApplicationRecord
  belongs_to :giver, class_name: 'Employee'
  belongs_to :receiver, class_name: 'Employee'
  belongs_to :company_value
  after_destroy :increashing_available_kudos, :remove_points_after_destroy_a_kudo
  after_save :decrashing_available_kudos, :adding_points_after_save_a_kudo
  validates :title, presence: true
  validates :content, presence: true

  validate :number_of_available_kudos_cannot_be_less_than_zero, on: :create

  def decrashing_available_kudos
    new_kudos = giver.number_of_available_kudos - 1
    Employee.update(giver_id, number_of_available_kudos: new_kudos)
  end

  def increashing_available_kudos
    new_kudos = giver.number_of_available_kudos + 1
    Employee.update(giver_id, number_of_available_kudos: new_kudos)
  end

  def adding_points_after_save_a_kudo
    points = receiver.points + 1
    Employee.update(receiver_id, points: points)
  end

  def remove_points_after_destroy_a_kudo
    points = receiver.points - 1
    Employee.update(receiver_id, points: points)
  end

  def number_of_available_kudos_cannot_be_less_than_zero
    return unless giver.number_of_available_kudos <= 0

    errors.add(:number_of_available_kudos, "You can't add more Kudos")
  end
end
