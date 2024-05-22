class CatalogDataController < ApplicationController
  before_action :set_catalog_datum, only: %i[ show edit update destroy ]

  # GET /catalog_data or /catalog_data.json
  def index
    @catalog_data = CatalogDatum.all
  end

  # GET /catalog_data/1 or /catalog_data/1.json
  def show
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
        format.html { redirect_to catalog_datum_url(@catalog_datum), notice: "Catalog datum was successfully updated." }
        format.json { render :show, status: :ok, location: @catalog_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @catalog_datum.errors, status: :unprocessable_entity }
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
      @catalog_datum = CatalogDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def catalog_datum_params
      params.require(:catalog_datum).permit(:catalog_id, :tuples, :created_by, :modified_by)
    end
end
