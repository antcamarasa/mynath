class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @therapists = User.where(therapist: true)
    # @results = @therapists.search_by_name_and_speciality(params[:query])
  end

  def index
    @therapists = User.where(therapist: true)
    @results = @therapists.search_by_name_and_speciality(params[:query])
  end
end
