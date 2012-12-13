class CapturasController < ApplicationController
  # GET /capturas
  # GET /capturas.json
  def index
    @capturas = Captura.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @capturas }
    end
  end

  # GET /capturas/1
  # GET /capturas/1.json
  def show
    @captura = Captura.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @captura }
    end
  end

  # GET /capturas/new
  # GET /capturas/new.json
  def new
    @captura = Captura.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @captura }
    end
  end

  # GET /capturas/1/edit
  def edit
    @captura = Captura.find(params[:id])
  end

  # POST /capturas
  # POST /capturas.json
  def create
    @captura = Captura.new(params[:captura])

    respond_to do |format|
      if @captura.save
        format.html { redirect_to @captura, notice: 'Captura was successfully created.' }
        format.json { render json: @captura, status: :created, location: @captura }
      else
        format.html { render action: "new" }
        format.json { render json: @captura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /capturas/1
  # PUT /capturas/1.json
  def update
    @captura = Captura.find(params[:id])

    respond_to do |format|
      if @captura.update_attributes(params[:captura])
        format.html { redirect_to @captura, notice: 'Captura was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @captura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capturas/1
  # DELETE /capturas/1.json
  def destroy
    @captura = Captura.find(params[:id])
    @captura.destroy

    respond_to do |format|
      format.html { redirect_to capturas_url }
      format.json { head :no_content }
    end
  end
end
