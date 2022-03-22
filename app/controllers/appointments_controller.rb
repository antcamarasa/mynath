class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  require 'twilio-ruby'

  def index
    @appointments = Appointment.all
    @user = current_user
  end

  def show
    @therapist = User.find(params[:therapist_id])
    @user = current_user
    # authorize @appointment
    @token = generate_token(@appointment)
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
      render "appointments#new"
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
    @timeframe = [[Time.new(2022, 3, 26, 10, 0, 0, '+04:00'), "10h00-11h00"], [Time.new(2022, 3, 26, 11, 0, 0, '+04:00'), "11h00-12h00"], [Time.new(2022, 3, 26, 14, 0, 0, '+04:00'), "14h00-15h00"], [Time.new(2022, 3, 26, 15, 0, 0, '+04:00'), "15h00-16h00"]]
  end

  def generate_token(appointment)
    # Create an Access Token
    token = Twilio::JWT::AccessToken.new ENV['ACCOUNT_SID'], ENV['KEY_ID'], ENV['AUTH_TOKEN'], [],
        ttl: 14400,
        identity: current_user.email
    # Grant access to Video
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = appointment.url_room
    token.add_grant grant
    # Serialize the token as a JWT
    token.to_jwt
  end
end
