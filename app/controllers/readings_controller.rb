class ReadingsController < ApplicationController
  before_action :set_reading, only: %i[ show update destroy ]

  # GET /readings
  def index
    @readings = Reading.all

    render json: @readings
  end

  # GET /readings/1
  def show
    render json: @reading
  end

  def reading_now
    @reading = Reading.find_by(status: "reading")
    render json: @reading
   end
  
  def current_reading
    @reading = Reading.find_by(id: params[:id], status: "reading")
    render json: @reading
  end

  def reading_finished
    @reading = Reading.where(status: "finished")
    render json: @reading
  end

  def finished_reading
    @reading = Reading.find_by(id: params[:id], status: "finished")
    render json: @reading
  end

  # POST /readings
  def create
    @reading = Reading.new(reading_params)

    if @reading.save
      render json: @reading, status: :created, location: @reading
    else
      render json: @reading.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /readings/1
  def update
    if @reading.update(reading_params)
      render json: @reading
    else
      render json: @reading.errors, status: :unprocessable_content
    end
  end

  # DELETE /readings/1
  def destroy
    @reading.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def reading_params
      params.expect(reading: [ :book_id, :status, :current_page, :started_at, :finished_at, :rating, :personal_note ])
    end
end
