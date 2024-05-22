class DataDictionary::DataDictionaryFieldsController < ApplicationController
    def new
        @data_dictionary_field = DataDictionaryField.new
        #@data_dictionary_field.data_dictionary_id = params[:data_dictionary_id]
    end

end