class CartuchosController < ApplicationController
  before_action :set_cartucho, only: [:show, :edit, :update, :destroy]

  # GET /cartuchos
  # GET /cartuchos.json
  def index
    @marcas = Cartucho.select('brand').distinct().where("brand <> '#N/A'and brand <> 'MARCA'")
    @impresoras = Printers.select('model','brand_model').where("model <> '#N/A' and model <> 'Impresora'")



    if params[:brand]
      @cartuchos = Cartucho.query(params).order("clave ASC").paginate(:page => params[:page], :per_page => 20)
      #@cartuchos = Cartucho.order("clave ASC").paginate(:page => params[:page], :per_page => 20)
    else
      @cartuchos = Cartucho.all
      @cartuchos = Cartucho.order("clave ASC").paginate(:page => params[:page], :per_page => 20)
    end  
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

  def searcher
    @cartuchos = Cartucho.search(params[:model_c],params[:brand],params[:model_i]).order("clave ASC").paginate(:page => params[:page], :per_page => 20)
    #aux2 = '%' + params[:brand] + '%'
    #@cartuchos = Cartucho.where('brand LIKE ? ', aux2).order("clave ASC").paginate(:page => params[:page], :per_page => 20)
    # puts "-------------------------------"
    # puts params.inspect
    # #puts @cartuchos
    # puts "-------------------------------"
  end
  def search_imp
    @cartuchos = Cartucho.search_imp(params[:model],params[:brand]).order("clave ASC").paginate(:page => params[:page], :per_page => 20)
    #aux2 = '%' + params[:brand] + '%'
    #@cartuchos = Cartucho.where('brand LIKE ? ', aux2).order("clave ASC").paginate(:page => params[:page], :per_page => 20)
    puts "-------------------------------"
    puts @cartuchos
    puts "-------------------------------"
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
    unless params[:archivo].blank?
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
              unless aux_contenier[0].blank?
                puts "entro otro >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><"
                Cartucho.create(brand: aux_contenier[0],clave: aux_contenier[1],rendimiento: aux_contenier[2],price: aux_contenier[3],precio_original: aux_contenier[4],model: aux_contenier[5],impresoras: aux_contenier[6],description: aux_contenier[7])
                contador2 +=1
              end   
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
        @marcas = Cartucho.select('brand').distinct()
        @impresoras = Cartucho.select('impresoras','brand')

        Brand.delete_all
        @marcas.each do |m|
          Brand.create(name: m.brand)
        end

        Printers.delete_all
        @impresoras.each do |i|

          b_m = i.brand.to_s + "-" + i.impresoras.to_s
          b_id = Brand.find_by(name: i.brand.to_s)
          Printers.create(brand_id: b_id, brand_name: i.brand.to_s, model: i.impresoras.to_s,brand_model: b_m )
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
