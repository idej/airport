class PlanesController < ApplicationController
  before_action :set_plane, only: [:destroy]

  # GET /planes
  def index
    @planes = Plane.all
  end

  # GET /planes/new
  def new
    @plane = Plane.new
  end

  # POST /planes
  def create
    @plane = Plane.new(plane_params)

    if @plane.save
      redirect_to :planes, notice: 'Plane was successfully created.'
    else
      render :new
    end
  end

  # DELETE /planes/1
  def destroy
    @plane.destroy
    redirect_to planes_url, notice: 'Plane was successfully destroyed.'
  end

  def departing
    if ids = params[:plane_ids]
      Plane.transaction do
        planes = Plane.find(ids)
        planes[0].start!
        planes[1..-1].each(&:wait!)
      end
    end
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plane
      @plane = Plane.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plane_params
      params.require(:plane).permit(:name)
    end
end
