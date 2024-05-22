class DataDictionaryFieldsController < ApplicationController
  before_action :set_data_dictionary_field, :set_data_dictionary, only: %i[ show edit update destroy ]

  # GET /data_dictionary_fields or /data_dictionary_fields.json
  def index
    #@data_dictionary_fields = DataDictionaryField.all

    if params[:id].present?
      data_dictionary = DataDictionary.find(params[:id])
      @catalog = Catalog.find(data_dictionary.catalog_id)
      @data_dictionary_id = params[:id]
      @data_dictionary_fields = DataDictionaryField.where(data_dictionary_id: params[:id]).joins(:field_type).select('data_dictionary_fields.*, field_types.name AS field_type_name')
    else
      @data_dictionary_fields = DataDictionaryField.all
    end

    #render json: @data_dictionary_fields
    respond_to do |format|
      format.html
      format.json { render json: @data_dictionary_fields }
    end
  end

  # GET /data_dictionary_fields/1 or /data_dictionary_fields/1.json
  def show
  end

  # GET /data_dictionary_fields/new
  def new
    #@data_dictionary_field = DataDictionaryField.new   
    #@data_dictionary_field.data_dictionary_id = params[:data_dictionary_id]
  end

  # GET /data_dictionary_fields/1/edit
  def edit
  end

  # POST /data_dictionary_fields or /data_dictionary_fields.json
  def create
    #field_params = params
    # @data_dictionary_field = DataDictionaryField.new
    # @data_dictionary = params[:data_dictionary]

  end

  # POST /data_dictionary_fields or /data_dictionary_fields.json
  # def create
  #   @data_dictionary_field = DataDictionaryField.new(data_dictionary_field_params)

  #   respond_to do |format|
  #     if @data_dictionary_field.save
  #       #format.turbo_stream { render :form_update, status: :unprocessable_entity }
        
  #       #format.html { redirect_to data_dictionary_field_url(@data_dictionary_field), notice: "Data dictionary field was successfully created." }
  #       format.html { redirect_to catalog_url(@data_dictionary_field.data_dictionary_id), notice: "Data dictionary field was successfully created." }
  #       format.json { render :show, status: :created, location: @data_dictionary_field }
  #       #format.js { render :create }

  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @data_dictionary_field.errors, status: :unprocessable_entity }
  #       format.turbo_stream { render :form_update, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /data_dictionary_fields/1 or /data_dictionary_fields/1.json
  def update
    respond_to do |format|
      if @data_dictionary_field.update(data_dictionary_field_params)
        format.html { redirect_to data_dictionary_field_url(@data_dictionary_field), notice: "Data dictionary field was successfully updated." }
        format.json { render :show, status: :ok, location: @data_dictionary_field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @data_dictionary_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_dictionary_fields/1 or /data_dictionary_fields/1.json
  def destroy
    # @data_dictionary_field.destroy!

    # respond_to do |format|
    #   format.html { redirect_to data_dictionary_fields_url, notice: "Data dictionary field was successfully destroyed." }
    #   format.json { head :no_content }
    # end
    
    @data_dictionary = DataDictionary.new(data_dictionary_fields: [DataDictionaryField.new])
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_data_dictionary_field      
      @data_dictionary_field = DataDictionaryField.find(params[:id])
    end

    def set_data_dictionary
      @data_dictionary = DataDictionary.new(data_dictionary_fields: [DataDictionaryField.new])
      # if params[:data_dictionary_id].present?
      #   @data_dictionary = DataDictionary.find(params[:data_dictionary_id])
      # else
      #   @data_dictionary = DataDictionary.new(data_dictionary_fields: [DataDictionaryField.new])
      # end
      #@data_dictionary = DataDictionary.find(params[:data_dictionary_id])
     
      #@data_dictionary_fields = @data_dictionary.data_dictionary_fields
    end

    # Only allow a list of trusted parameters through.
    def data_dictionary_field_params
      params.require(:data_dictionary_field).permit(:data_dictionary_id, :version, :field_name, :field_type_id, :field_description, :created_by, :modified_by)
    end
end
