class Catalog < ApplicationRecord
    has_many :data_dictionaries

    validates :name, presence: true
end
