class DataDictionaryField < ApplicationRecord
  belongs_to :data_dictionary
  belongs_to :field_type
  
end
