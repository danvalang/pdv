class PdvsController < ApplicationController
  # before_filter :fases_redirect


  # def fases_redirect
  #   if current_user
  #     redirect_to fases_path if current_user.is_admin
  #   end
  # end

  # GET /pdvs
  # GET /pdvs.json
  def index


    # unless current_user.is_admin
      @pdvs = Pdv.includes(:cadena, :captura).asignadas(current_user, params[:page] )
    # else
       # @pdvs = Pdv.all
    # end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pdvs }
    end

  end

  # GET /pdvs/1
  # GET /pdvs/1.json
  def show

    @pdv = Pdv.find(params[:id])
    @pdv.asegurar
    @json = @pdv.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pdv }

    end
  end

  # # GET /pdvs/new
  # # GET /pdvs/new.json
  # def new
  #   @pdv = Pdv.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @pdv }
  #   end
  # end

  # GET /pdvs/1/edit
  def edit
    @pdv = Pdv.find(params[:id])
    @pdv.asegurar
    # @pdv.captura = Captura.new(curt: @pdv.curt) unless @pdv.captura.presence
    @json = @pdv.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pdv }

    end
  end

  # # POST /pdvs
  # # POST /pdvs.json
  # def create
  #   @pdv = Pdv.new(params[:pdv])
  #   @pdv.status_reg = "NO REVISADO"

  #   respond_to do |format|
  #     if @pdv.save
  #       format.html { redirect_to @pdv, notice: 'Pdv was successfully created.' }
  #       format.json { render json: @pdv, status: :created, location: @pdv }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @pdv.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PUT /pdvs/1
  # PUT /pdvs/1.json
  def update
    @pdv = Pdv.find(params[:id])

    respond_to do |format|
      if @pdv.update_attributes(params[:pdv])
        format.html { redirect_to @pdv, notice: 'Pdv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pdv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdvs/1
  # DELETE /pdvs/1.json
  def destroy
    @pdv = Pdv.find(params[:id])
    @pdv.destroy

    respond_to do |format|
      format.html { redirect_to pdvs_url }
      format.json { head :no_content }
    end
  end
end
