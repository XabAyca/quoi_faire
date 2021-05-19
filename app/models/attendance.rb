class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  # after_create :attendance_created

  def attendance_created
    UserMailer.attendance_email(self).deliver_now
  end
end
