require 'pry'
class CatalogDataController < ApplicationController
  before_action :set_catalog_datum, only: %i[ show edit update destroy ]

  # GET /catalog_data or /catalog_data.json
  def index
    @catalog_data = CatalogDatum.all
  end

  # GET /catalog_data/1 or /catalog_data/1.json
  def show
    #binding.pry
    @data_dictionary_id = params[:id]
    @catalog_datum = CatalogDatum.find_by(data_dictionary_id: @data_dictionary_id)
  end

  # GET /catalog_data/new
  def new
    @catalog_datum = CatalogDatum.new
  end

  # GET /catalog_data/1/edit
  def edit
  end

  # POST /catalog_data or /catalog_data.json
  def create
    @catalog_datum = CatalogDatum.new(catalog_datum_params)

    respond_to do |format|
      if @catalog_datum.save
        format.html { redirect_to catalog_datum_url(@catalog_datum), notice: "Catalog datum was successfully created." }
        format.json { render :show, status: :created, location: @catalog_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @catalog_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalog_data/1 or /catalog_data/1.json
  def update
    respond_to do |format|
      if @catalog_datum.update(catalog_datum_params)
        format.html { redirect_to catalog_datum_url(@catalog_datum), alert: "Catalog datum was successfully updated." }
        format.json { render :show, status: :ok, location: @catalog_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @catalog_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  def import_csv
    csv_file = params[:csv_file].path
    csv_data = CSV.read(csv_file, headers: true)
    json_data = csv_data.map(&:to_h).to_json
    @catalog_datum.tuples = json_data
    @catalog_datum.save
    redirect_to catalog_data_path(@catalog_datum), notice: 'CSV data imported successfully'
  end

  def import
    if !params[:data_file].nil?
      respond_to do |format|
        require 'roo'
        xlsx = Roo::Spreadsheet.open(params[:data_file].path)
        headers = xlsx.row(1)
        json_data = []

        (2..xlsx.last_row).each do |i|
          row = Hash[[headers, xlsx.row(i)].transpose]
          json_data << row
        end

        data_dictionary = DataDictionary.find(params[:data_dictionary_id])
        data_dictionary_fields = data_dictionary.data_dictionary_fields.pluck(:field_name)
        spreadsheet_headers = headers.map(&:to_s)
        #binding.pry
        unless data_dictionary_fields == spreadsheet_headers
          @catalog_datum = CatalogDatum.new
          @catalog_datum.errors.add(:base, "Columnas no válidas. Esperado: #{data_dictionary_fields}, Actual: #{spreadsheet_headers}")
          #format.html { render :show, status: :unprocessable_entity }
          format.html { redirect_to catalog_path(params[:data_dictionary_id]), alert: "Columnas no válidas. Esperado: #{data_dictionary_fields}, Actual: #{spreadsheet_headers}" }
          format.json { render json: @catalog_datum.errors, status: :unprocessable_entity }
          #format.turbo_stream { render :form_update, status: :unprocessable_entity }
        else
          @catalog_datum = CatalogDatum.new
          json_rows = json_data.to_json
          @data_dictionary = DataDictionary.find(params[:data_dictionary_id])
          @catalog_datum.catalog_id = @data_dictionary.catalog_id
          @catalog_datum.data_dictionary_id = @data_dictionary.id
          @catalog_datum.tuples = json_rows

          if @catalog_datum.save
            format.html { redirect_to catalogs_url, notice: "File successfully imported." }
            format.json { render :show, status: :created, location: @catalog_datum }
          else
            format.html { render :show, status: :unprocessable_entity }
            format.json { render json: @catalog_datum.errors, status: :unprocessable_entity }
            format.turbo_stream { render :form_update, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # DELETE /catalog_data/1 or /catalog_data/1.json
  def destroy
    @catalog_datum.destroy!

    respond_to do |format|
      format.html { redirect_to catalog_data_url, notice: "Catalog datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog_datum
      #@catalog_datum = CatalogDatum.find(params[:id])
      @catalog_datum = CatalogDatum.find_by(data_dictionary_id: params[:id]) 
    end

    # Only allow a list of trusted parameters through.
    def catalog_datum_params
      params.require(:catalog_datum).permit(:catalog_id, :tuples, :created_by, :modified_by)
    end
end
