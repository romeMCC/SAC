class CatalogsController < ApplicationController
  before_action :set_catalog, only: %i[ show edit update destroy ]
  # GET /catalogs or /catalogs.json
  def index
    @catalogs = Catalog.all
    @catalog = Catalog.new
  end

  # GET /catalogs/1 or /catalogs/1.json
  def show
  end

  # GET /catalogs/new
  def new
    @catalog = Catalog.new
  end

  # GET /catalogs/1/edit
  def edit
  end

  # POST /catalogs or /catalogs.json
  def create
    @catalog = Catalog.new(catalog_params)

    respond_to do |format|
      if @catalog.save
        # format.html { redirect_to catalog_url(@catalog), notice: "Catalog was successfully created." }
        # format.json { render :show, status: :created, location: @catalog }
        #format.html { redirect_to catalogs_url, notice: "Catalog was successfully created." }
        #format.json { render :show, status: :created, location: @catalog }
        #format.js { render js: "closeModal();" } # replace with your JS function to hide the modal
        format.html { redirect_to catalogs_url, notice: "Catalog was successfully created." }
        format.json { render :show, status: :created, location: @catalog }
      else
        #format.js { render :errors }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogs/1 or /catalogs/1.json
  def update
    respond_to do |format|
      if @catalog.update(catalog_params)
        format.html { redirect_to catalogs_url, notice: "Catalog was successfully updated." }
        format.json { render :show, status: :ok, location: @catalog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/1 or /catalogs/1.json
  def destroy
    @catalog.destroy!

    respond_to do |format|
      format.html { redirect_to catalogs_url, notice: "Catalog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def catalog_params
      params.require(:catalog).permit(:name, :description, :created_by, :modified_by)
    end
end
