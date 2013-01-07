class FasesController < ApplicationController


  # before_filter :redir

  # def redir
  #   unless current_user.is_admin?
  #     redirect_to pdvs_path
  #   end
  # end
  # GET /fases
  # GET /fases.json
  def index
    @fases = Fase.order("fecha desc").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fases }
    end
  end

  # GET /fases/1
  # GET /fases/1.json
  def show
    @fase = Fase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fase }
    end
  end

  # GET /fases/new
  # GET /fases/new.json
  def new
    @fase = Fase.new
    @fase.fecha = Time.now

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fase }
    end
  end

  # GET /fases/1/edit
  def edit
    @fase = Fase.find(params[:id])
  end

  # POST /fases
  # POST /fases.json
  def create
    @fase = Fase.new(params[:fase])
    # @fase.users 
    @fase.asignar

    respond_to do |format|
      if @fase.save
        
        format.html { redirect_to @fase, notice: 'Fase fue creada.' }
        format.json { render json: @fase, status: :created, location: @fase }
      else
        format.html { render action: "new" }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fases/1
  # PUT /fases/1.json
  def update
    @fase = Fase.find(params[:id])
    # @fase.users 

    respond_to do |format|
      if @fase.update_attributes(params[:fase])
        # @fase.asignar
        format.html { redirect_to @fase, notice: 'Fase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fases/1
  # DELETE /fases/1.json
  def destroy
    @fase = Fase.find(params[:id])
    @fase.destroy

    respond_to do |format|
      format.html { redirect_to fases_url }
      format.json { head :no_content }
    end
  end
end
