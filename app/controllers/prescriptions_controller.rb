class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:new, :create, :edit, :update]

  # GET prescriptions for current user
  def user_prescriptions
    user = current_user
    @prescriptions = user.prescriptions
    render :index
  end

  # GET /prescriptions/1
  def show
  end

  # GET /prescriptions/new
  def new
    @prescription = Prescription.new
  end

  # GET /beaches/1/edit
  def edit
  end

  # POST /beaches
  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.user = current_user
    if @prescription.save
      redirect_to @prescription, notice: 'Ordonnance bien créée !'
    else
      render :new
    end
  end

  # PATCH/PUT /prescriptions/1
  def update
    if @prescription.update(prescription_params)
      redirect_to @prescription, notice: 'Votre ordonnance est mise à jour !'
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
    params.require(:prescription).permit(:description, :date)
  end
end
