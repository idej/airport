class PlanesController < ApplicationController
  before_action :set_plane, only: [:show, :edit, :update, :destroy]

  # GET /planes
  def index
    @planes = Plane.all
  end

  # GET /planes/1
  def show
  end

  # GET /planes/new
  def new
    @plane = Plane.new
  end

  # GET /planes/1/edit
  def edit
  end

  # POST /planes
  def create
    @plane = Plane.new(plane_params)

    if @plane.save
      redirect_to @plane, notice: 'Plane was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /planes/1
  def update
    if @plane.update(plane_params)
      redirect_to @plane, notice: 'Plane was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /planes/1
  def destroy
    @plane.destroy
    redirect_to planes_url, notice: 'Plane was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plane
      @plane = Plane.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plane_params
      params.require(:plane).permit(:state)
    end
end
