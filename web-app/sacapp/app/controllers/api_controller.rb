require 'pry'
class ApiController < ApplicationController
  def retrieve_data
    binding.pry
    version = params[:version]
    data_dictionary = DataDictionary.find_by(version: version)
    if data_dictionary.nil?
        render json: { error: "Data dictionary with version #{version} not found" }, status: :not_found
    else
        catalog_datum = CatalogDatum.find_by(data_dictionary_id: data_dictionary.id)
        if catalog_datum.nil?
        render json: { error: "Catalog datum not found for data dictionary with version #{version}" }, status: :not_found
        else
        render json: catalog_datum.tuples
        end
    end              
  end
end