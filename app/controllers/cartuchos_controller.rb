class CartuchosController < ApplicationController
  before_action :set_cartucho, only: [:show, :edit, :update, :destroy]

  # GET /cartuchos
  # GET /cartuchos.json
  def index
    @cartuchos = Cartucho.all
  end

  # GET /cartuchos/1
  # GET /cartuchos/1.json
  def show
  end

  # GET /cartuchos/new
  def new
    @cartucho = Cartucho.new
  end

  # GET /cartuchos/1/edit
  def edit
  end

  def list
    @cartuchos = Cartucho.all
  end  

  # POST /cartuchos
  # POST /cartuchos.json
  def create
    @cartucho = Cartucho.new(cartucho_params)

    respond_to do |format|
      if @cartucho.save
        format.html { redirect_to @cartucho, notice: 'Cartucho was successfully created.' }
        format.json { render :show, status: :created, location: @cartucho }
      else
        format.html { render :new }
        format.json { render json: @cartucho.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cartuchos/1
  # PATCH/PUT /cartuchos/1.json
  def update
    respond_to do |format|
      if @cartucho.update(cartucho_params)
        format.html { redirect_to @cartucho, notice: 'Cartucho was successfully updated.' }
        format.json { render :show, status: :ok, location: @cartucho }
      else
        format.html { render :edit }
        format.json { render json: @cartucho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartuchos/1
  # DELETE /cartuchos/1.json
  def destroy
    @cartucho.destroy
    respond_to do |format|
      format.html { redirect_to cartuchos_url, notice: 'Cartucho was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartucho
      @cartucho = Cartucho.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cartucho_params
      params.require(:cartucho).permit(:title, :description, :image_url, :price, :brand, :model, :color, :price_40, :price_21, :price_10)
    end
end
