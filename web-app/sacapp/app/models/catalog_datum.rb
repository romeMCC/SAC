class CatalogDatum < ApplicationRecord
  belongs_to :catalog
  belongs_to :data_dictionary
end
