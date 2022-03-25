class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :time_frame, only: :new
  require 'twilio-ruby'

  def patient_appointments
    @user = User.find(params[:id])
    @patient_appointments = Appointment.where(users_id: @user)
    @therapist = current_user
    @appointments = @patient_appointments.where(therapists_id: @therapist)
    # @appointments_therapist = Appointment.where(therapists_id: current_user)

  end

  def index
    @user = current_user
    @appointments = Appointment.where(users_id: @user)
    @appointments_therapist = Appointment.where(therapists_id: current_user)
  end

  def show
    @therapist = User.find(params[:therapist_id])
    @user = current_user
  end

  def new
    @therapist = User.find(params[:therapist_id])
    @appointment = Appointment.new
    @user = current_user
    time_frame
  end

  def create
    @therapist = User.find(params[:therapist_id])
    @appointment = Appointment.new(appointment_params)
    @user = current_user
    @appointment.users_id = @user.id
    @appointment.therapists_id = @therapist.id
    if @appointment.save
      redirect_to therapist_appointment_path(@therapist, @appointment)
    else
      flash[:notice] = 'Erreur ! Selectionner un horaire'
      redirect_to new_therapist_appointment_path(@therapist)
    end

  end

  def edit
    time_frame
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Votre RDV est bien Mis à jour.'
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: 'Votre RDV est Annulé.'
  end

private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date_time, :time)
  end

  def time_frame
    @timeframe = [["09h00-10h00", Time.new(2022, 3, 26, 10, 0, 0, '+04:00')], ["10h00-11h00", Time.new(2022, 3, 26, 10, 0, 0, '+04:00')], ["11h00-12h00", Time.new(2022, 3, 26, 11, 0, 0, '+04:00')], ["14h00-15h00", Time.new(2022, 3, 26, 14, 0, 0, '+04:00')], ["15h00-16h00", Time.new(2022, 3, 26, 15, 0, 0, '+04:00')], ["16h00-17h00", Time.new(2022, 3, 26, 15, 0, 0, '+04:00')], ["17h00-18h00", Time.new(2022, 3, 26, 15, 0, 0, '+04:00')]]
  end


end
