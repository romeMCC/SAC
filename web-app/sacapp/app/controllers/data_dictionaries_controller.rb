class DataDictionariesController < ApplicationController
  before_action :set_data_dictionary, :set_catalog, only: %i[ show edit update destroy ]

  # GET /data_dictionaries or /data_dictionaries.json
  def index

    if params[:catalog_id].present?
      @catalog_id = params[:catalog_id]
      @data_dictionaries = DataDictionary.where(catalog_id: params[:catalog_id])
    else
      @data_dictionaries = DataDictionary.build
    end
    
    @data_dictionary = DataDictionary.new

    respond_to do |format|
      format.html
      format.json { render json: @data_dictionaries }
    end
  end

  # GET /data_dictionaries/1 or /data_dictionaries/1.json
  def show
  end

  # GET /data_dictionaries/new
  def new
    @data_dictionary = DataDictionary.new(data_dictionary_fields: [DataDictionaryField.new])
    @data_dictionary.catalog_id = params[:catalog_id]
    @data_dictionary.version = Date.current.strftime("%Y%m%d") + "-#{DataDictionary.all.count + 1}"
    @data_dictionary.current_version = true    
    @data_dictionary.created_at = Time.now
    @data_dictionary.data_dictionary_fields.build
  end

  # GET /data_dictionaries/1/edit
  def edit
  end

  # POST /data_dictionaries or /data_dictionaries.json
  def create
    @data_dictionary = DataDictionary.new(data_dictionary_params)
    @data_dictionary.created_by = current_user.email
    #@data_dictionary.version = @data_dictionary.new_record? ? Date.current.strftime("%Y%m%d") + "-#{DataDictionary.count + 1}" : @data_dictionary.version
    respond_to do |format|
      if @data_dictionary.save
        #format.html { redirect_to data_dictionary_url(@data_dictionary), notice: "Data dictionary was successfully created." }
        format.html { redirect_to catalog_url(@data_dictionary.catalog_id), notice: "Data dictionary was successfully created." }
        format.json { render :show, status: :created, location: @data_dictionary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @data_dictionary.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_dictionaries/1 or /data_dictionaries/1.json
  def update
    respond_to do |format|
      if @data_dictionary.update(data_dictionary_params)
        #format.html { redirect_to data_dictionary_url(@data_dictionary), notice: "Data dictionary was successfully updated." }
        format.html { redirect_to data_dictionary_url, notice: "Data dictionary was successfully updated." }
        format.json { render :show, status: :ok, location: @data_dictionary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @data_dictionary.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_dictionaries/1 or /data_dictionaries/1.json
  def destroy
    @data_dictionary.destroy!

    respond_to do |format|
      format.html { redirect_to data_dictionaries_url, notice: "Data dictionary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_dictionary
      @data_dictionary = DataDictionary.find(params[:id])
    end

    def set_catalog
      if params[:catalog_id].present?
        @catalog = Catalog.find(params[:catalog_id])
      end
      #@data_dictionary = DataDictionary.find(params[:data_dictionary_id])
    end
    # Only allow a list of trusted parameters through.
    def data_dictionary_params
      # params.require(:data_dictionary).permit!
      params.require(:data_dictionary).permit(
        :version, 
        :current_version, 
        :modification_type_id, 
        :description, 
        :catalog_id, 
        :created_by, 
        :modified_by, 
        data_dictionary_fields_attributes: [:field_name, :field_type_id, :field_description]
      )

    end
end
