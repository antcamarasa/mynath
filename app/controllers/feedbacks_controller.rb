class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only: :index


  # GET /feedbacks for appointment_id
  def index
    #@feedbacks = Feedback.where(appointment_id: @appointment)
    @appointment = Appointment.first
    @feedbacks = @appointment.feedbacks
    @feedback = Feedback.new
  end

  # GET /feedbackes/1
  def show
  end

  # GET /feedbackes/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbackes/1/edit
  def edit
  end

  # POST /feedbackes
  def create
    @appointment = Appointment.first
    @feedback = Feedback.new(feedback_params)
    @feedback.appointment = @appointment
    if @feedback.save
      redirect_to appointment_feedbacks_path, notice: 'feedback was successfully created.'
    else
      render :index
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @feedback.update(feedback_params)
      redirect_to @feedback, notice: 'feedback was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/1
  def destroy
    @feedback.destroy
    redirect_to feedbackes_url, notice: 'feedback was successfully destroyed.'
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:review_patient, :review_therapist)
  end
end
