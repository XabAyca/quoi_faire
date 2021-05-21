class Admin::AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_is_admin

  def index
    @admin = current_user
    @attendances = Attendance.all
  end

end
