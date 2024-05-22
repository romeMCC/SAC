class FieldTypesController < ApplicationController
    def index
      @field_types = FieldType.all
      render json: @field_types
    end
  end