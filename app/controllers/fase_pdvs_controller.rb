class FasePdvsController < ApplicationController
	before_filter :get_fase

  # def fases_redirect
  #   unless current_user.is_admin
  #     redirect_to root_url
  #   end
  # end

  def get_fase
  	@fase = Fase.find(params[:fase_id])

  end


  def index



       @fase_pdv = @fase.pdvs.all#.page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pdvs }
    end

  end

  # GET /pdvs/1
  # GET /pdvs/1.json
  def show

    @fase_pdv = @fase.pdvs.find(params[:id])
    # @fase_pdv.asegurar
    @json = @fase_pdv.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pdv }

    end
  end

  def edit
    @fase_pdv = @fase.pdvs.find(params[:id])
    @fase_pdv.asegurar
    # @pdv.captura = Captura.new(curt: @pdv.curt) unless @pdv.captura.presence
    @json = @fase_pdv.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pdv }

    end
  end

  # PUT /pdvs/1
  # PUT /pdvs/1.json
  def update
    @pdv = @fase.pdvs.find(params[:id])

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

end