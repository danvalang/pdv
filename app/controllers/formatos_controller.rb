# class FormatosController < ApplicationController
#   # GET /formatos
#   # GET /formatos.json
#   def index
#     @formatos = Formato.all

#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @formatos }
#     end
#   end

#   # GET /formatos/1
#   # GET /formatos/1.json
#   def show
#     @formato = Formato.find(params[:id])

#     respond_to do |format|
#       format.html # show.html.erb
#       format.json { render json: @formato }
#     end
#   end

#   # GET /formatos/new
#   # GET /formatos/new.json
#   def new
#     @formato = Formato.new

#     respond_to do |format|
#       format.html # new.html.erb
#       format.json { render json: @formato }
#     end
#   end

#   # GET /formatos/1/edit
#   def edit
#     @formato = Formato.find(params[:id])
#   end

#   # POST /formatos
#   # POST /formatos.json
#   def create
#     @formato = Formato.new(params[:formato])

#     respond_to do |format|
#       if @formato.save
#         format.html { redirect_to @formato, notice: 'Formato was successfully created.' }
#         format.json { render json: @formato, status: :created, location: @formato }
#       else
#         format.html { render action: "new" }
#         format.json { render json: @formato.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PUT /formatos/1
#   # PUT /formatos/1.json
#   def update
#     @formato = Formato.find(params[:id])

#     respond_to do |format|
#       if @formato.update_attributes(params[:formato])
#         format.html { redirect_to @formato, notice: 'Formato was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @formato.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /formatos/1
#   # DELETE /formatos/1.json
#   def destroy
#     @formato = Formato.find(params[:id])
#     @formato.destroy

#     respond_to do |format|
#       format.html { redirect_to formatos_url }
#       format.json { head :no_content }
#     end
#   end
# end
