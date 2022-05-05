class AttendantsController < ApplicationController
  before_action :set_attendant, only: %i[ show update destroy ]

  # GET /attendants
  def index
    @attendants = Attendant.all

    render json: @attendants
  end

  # GET /attendants/1
  def show
    render json: @attendant
  end

  # POST /attendants
  def create
    @attendant = Attendant.new(attendant_params)

    if @attendant.save
      render json: @attendant, status: :created, location: @attendant
    else
      render json: @attendant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attendants/1
  def update
    if @attendant.update(attendant_params)
      render json: @attendant
    else
      render json: @attendant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attendants/1
  def destroy
    @attendant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendant
      @attendant = Attendant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendant_params
      params.require(:attendant).permit(:first_name, :last_name, :contact_email, :company_name, :contact_whatsapp, :contact_linked_in)
    end
end
