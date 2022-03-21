class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @therapists = User.where(therapist: true)
    # @results = @therapists.search_by_name_and_speciality(params[:query])
    # @a = Appointment.select(:user_id => current_user).distinct#.where(therapists_id: User.therapists_id)
    @appointments = Appointment.where(:users_id => current_user)
    @appointment_uniq = @appointments.uniq(&:therapists_id)
  end

  def index
    @therapists = User.where(therapist: true)
    @results = @therapists.search_by_name_and_speciality(params[:query])
    if @results == nil
      redirect_to therapists_path(@therapist)
    end
  end

  def visio
    @appointment = Appointment.find(params[:appointment_id])
    @therapist = @appointment.therapist
  end
end
