class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:edit, :update]

  # GET prescriptions for current user
  def user_prescriptions
    user = current_user
    @prescriptions = user.prescriptions
    render :index
  end

  def index
    @prescriptions = Prescription.all
    # Cloudinary::Utils.private_download_url self.cloudinary_id, self.format, attachment: true
  end

  # # GET /prescriptions/1
  # def show
  # end

  # GET /prescriptions/new
  def new
    if current_user.therapist?
      @prescription = Prescription.new
      @appointment = Appointment.find(params[:appointment_id])
    else "Vous ne pouvez-pas créer d'ordonnance"
    end
  end

  # GET /beaches/1/edit
  def edit
  end

  # POST /beaches
  def create
    @appointment = Appointment.find(params[:appointment_id])
    @prescription = Prescription.new(prescription_params)
    @prescription.appointment_id = @appointment.id
    @prescription.date = Date.today
    if @prescription.save
      redirect_to appointment_path(@appointment.id), notice: 'Ordonnance bien créée !'
    else
      render :new
    end
  end

  # PATCH/PUT /prescriptions/1
  def update
    if @prescription.update(prescription_params)
      redirect_to appointment_path(@appointment.id), notice: 'Votre ordonnance est mise à jour !'
    else
      render :edit
    end
  end

  # DELETE /prescriptions/1
  def destroy
    @prescription.destroy
    redirect_to prescriptions_url, notice: 'Votre ordonnance est supprimée!'
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:id])
  end

  def prescription_params
    params.require(:prescription).permit(:description, :date, :document)
  end
end
