class FeedbacksController < ApplicationController
  before_action :set_appointment, only: [:index, :create]
  # skip_before_action :authenticate_user!, only: :index


  # GET /feedbacks for appointment_id
  def index
    @feedbacks = @appointment.feedbacks
    @feedback = Feedback.new
  end

  # POST /feedbackes
  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.appointment = @appointment
    if @feedback.save
      redirect_to appointment_feedbacks_path, notice: 'feedback was successfully created.'
    else
      render :index
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def feedback_params
    params.require(:feedback).permit(:review_patient, :review_therapist)
  end
end
