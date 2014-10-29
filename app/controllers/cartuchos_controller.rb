class CartuchosController < ApplicationController
  before_action :set_cartucho, only: [:show, :edit, :update, :destroy]

  # GET /cartuchos
  # GET /cartuchos.json
  def index
    @cartuchos = Cartucho.all
    @cartuchos = Cartucho.order("clave ASC").paginate(:page => params[:page], :per_page => 20) 
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
  #funciones para subir archivos csv

  def import
    
  end

  def upload
    require 'csv'
      @csv_file_path = DataFile.save(params[:archivo])
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      puts @csv_file_path
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

      unless @csv_file_path.blank?
        puts "-----------------direccion actual-2--------------"
        puts Dir.pwd
        puts "------------------------------------------------"
        directory = "public/data"
        Dir.chdir(directory) do
          if File.exist?(@csv_file_path.to_s)
            puts "esta en local"
            arr_of_rows = CSV.read(@csv_file_path.to_s)
           
            puts arr_of_rows.inspect

          else
            if File.exist?(@csv_file_path.to_s)
              puts "esta en produccion"
              arr_of_rows = CSV.read(@csv_file_path.to_s)
              puts arr_of_rows.inspect
            else
              puts "------------------------------------------------"
              puts "no entro a ninguno"
              puts @csv_file_path.to_s
              puts @csv_file_path.to_s
              puts "------------------------------------------------"
            end
          end
          
          contador = 0
          contador2 = 0
          Cartucho.delete_all
          arr_of_rows.each do |a|
            aux_contenier = a
            puts "------------------------"
            puts aux_contenier
            puts "------------------------"
            if aux_contenier.size == 8 
              @cartucho_comp = Cartucho.find_by(clave: aux_contenier[1])
              #if @cartucho_comp.blank?
                puts "entro otro >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><"
                Cartucho.create(brand: aux_contenier[0],clave: aux_contenier[1],rendimiento: aux_contenier[2],price: aux_contenier[3],precio_original: aux_contenier[4],model: aux_contenier[5],impresoras: aux_contenier[6],description: aux_contenier[7])
                contador2 +=1
                 
              # else
              #   puts "------------------------"
              #   puts @cartucho_comp.inspect 
              #   puts "------------------------" 
              # end
              contador +=1
              puts "------------------------"
              puts "------------------------" 
              puts "contador de size:" + contador.to_s
              puts "------------------------" 
              puts "------------------------" 
              puts "------------------------"
              puts "------------------------" 
              puts "contador inserts:" + contador2.to_s
              puts "------------------------" 
              puts "------------------------" 
            end

          end
        end
      end
      redirect_to store_path
  end 
  ####terminan csv




  

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
