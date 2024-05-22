class DataDictionary < ApplicationRecord
  belongs_to :modification_type
  belongs_to :catalog
  has_many :data_dictionary_fields
  accepts_nested_attributes_for :data_dictionary_fields
  after_save :set_current_version

  validates :catalog_id, presence: true
  validates :modification_type_id, presence: true

  def set_current_version
    if current_version
      DataDictionary.where(catalog_id: catalog_id).where.not(id: id).update_all(current_version: false)
    end
  end

  
end
