# class TiendasController < ApplicationController
#   # GET /tiendas
#   # GET /tiendas.json
#   def index
#     @tiendas = Tienda.desactualizada.limit(20)

#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @tiendas }
#     end
#   end

#   # GET /tiendas/1
#   # GET /tiendas/1.json
#   def show
#     @tienda = Tienda.find(params[:id])
#     @tienda.asegurar
#     @json = @tienda.to_gmaps4rails


#     respond_to do |format|
#       format.html # show.html.erb
#       format.json { render json: @tienda }
#     end
#   end

#   # GET /tiendas/new
#   # GET /tiendas/new.json
#   def new
#     @tienda = Tienda.new

#     respond_to do |format|
#       format.html # new.html.erb
#       format.json { render json: @tienda }
#     end
#   end

#   # GET /tiendas/1/edit
#   def edit
#     @tienda = Tienda.find(params[:id])
#     @tienda.asegurar
#     @json = @tienda.to_gmaps4rails
#   end

#   # POST /tiendas
#   # POST /tiendas.json
#   def create
#     @tienda = Tienda.new(params[:tienda])

#     respond_to do |format|
#       if @tienda.save
#         format.html { redirect_to @tienda, notice: 'Tienda was successfully created.' }
#         format.json { render json: @tienda, status: :created, location: @tienda }
#       else
#         format.html { render action: "new" }
#         format.json { render json: @tienda.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PUT /tiendas/1
#   # PUT /tiendas/1.json
#   def update
#     @tienda = Tienda.find(params[:id])

#     respond_to do |format|
#       if @tienda.update_attributes(params[:tienda])
#         format.html { redirect_to @tienda, notice: 'Tienda was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @tienda.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /tiendas/1
#   # DELETE /tiendas/1.json
#   def destroy
#     @tienda = Tienda.find(params[:id])
#     @tienda.destroy

#     respond_to do |format|
#       format.html { redirect_to tiendas_url }
#       format.json { head :no_content }
#     end
#   end
# end
