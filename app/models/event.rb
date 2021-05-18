class Event < ApplicationRecord
  validates :start_date,
    presence: {message: 'Date de départ obligatoire'}
    validate :start_date_is_past

  validates :duration, 
    presence: {message: 'Durée obligatoire'},
    numericality: {greater_than: 0}
    validate :is_duration_multiple_5

  validates :title,
    presence: {message: "Titre obligatoire"},
    length: {in: 5..140}

  validates :description,
    presence: {message: "Description obligatoire"},
    length: {in: 20..1000}

  validates :price,
    presence: {message: "Prix obligatoire"},
    numericality: {only_integer: true, greater_than: 0, less_than: 1000, message: "Le prix doit être compris entre 1 et 1 000"}

  validates :location,
    presence: {message: "Lieu obligatoire"}
  
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  belongs_to :admin, class_name: 'User'

  def start_date_is_past
    if start_date.past?
      errors.add(:start_date, "Date non valide")
    end
  end

  def is_duration_multiple_5
    if duration % 5 != 0
      errors.add(:duration, "La durée doit être un multiple de 5")
    end
  end

  def end_date 
    @end_date = start_date + duration*60
  end

end
