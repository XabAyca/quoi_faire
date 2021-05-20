class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
  has_many :events, foreign_key: 'admin_id', class_name: 'Event', dependent: :destroy
  has_one_attached :profil_img

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
