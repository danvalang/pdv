# class CanalesController < ApplicationController
#   # GET /canales
#   # GET /canales.json
#   def index
#     @canales = Canale.all

#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @canales }
#     end
#   end

#   # GET /canales/1
#   # GET /canales/1.json
#   def show
#     @canale = Canale.find(params[:id])

#     respond_to do |format|
#       format.html # show.html.erb
#       format.json { render json: @canale }
#     end
#   end

#   # GET /canales/new
#   # GET /canales/new.json
#   def new
#     @canale = Canale.new

#     respond_to do |format|
#       format.html # new.html.erb
#       format.json { render json: @canale }
#     end
#   end

#   # GET /canales/1/edit
#   def edit
#     @canale = Canale.find(params[:id])
#   end

#   # POST /canales
#   # POST /canales.json
#   def create
#     @canale = Canale.new(params[:canale])

#     respond_to do |format|
#       if @canale.save
#         format.html { redirect_to @canale, notice: 'Canale was successfully created.' }
#         format.json { render json: @canale, status: :created, location: @canale }
#       else
#         format.html { render action: "new" }
#         format.json { render json: @canale.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PUT /canales/1
#   # PUT /canales/1.json
#   def update
#     @canale = Canale.find(params[:id])

#     respond_to do |format|
#       if @canale.update_attributes(params[:canale])
#         format.html { redirect_to @canale, notice: 'Canale was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @canale.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /canales/1
#   # DELETE /canales/1.json
#   def destroy
#     @canale = Canale.find(params[:id])
#     @canale.destroy

#     respond_to do |format|
#       format.html { redirect_to canales_url }
#       format.json { head :no_content }
#     end
#   end
# end
