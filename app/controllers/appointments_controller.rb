class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
    @user = current_user
  end

  def show
    @therapist = User.find(params[:therapist_id])
    @user = current_user
    #@therapist = @appointment.therapists_id
  end

  def new
    @therapist = User.find(params[:therapist_id])
    @appointment = Appointment.new
    @user = current_user
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
      render :new
    end

  end

  def edit
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
    params.require(:appointment).permit(:date_time)
  end
end
