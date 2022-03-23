class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @therapists = User.where(therapist: true)
    # @results = @therapists.search_by_name_and_speciality(params[:query])
    # @a = Appointment.select(:user_id => current_user).distinct#.where(therapists_id: User.therapists_id)
    @therapists = User.where(therapist: true)
    @appointments = Appointment.where(:users_id => current_user)
    @appointment_uniq = @appointments.uniq(&:therapists_id)
  end

  def patients
    @appointments = Appointment.where(:therapists_id => current_user)
    @appointment_uniq = @appointments.uniq(&:users_id)
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
    @token = generate_token(@appointment)
  end

  private

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
