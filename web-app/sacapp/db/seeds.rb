# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
ModificationType.create!([{
        name: "NUEVA COLUNNA"
    },
    {
        name: "ELIMINACIÓN COLUNNA"
    },
    {
        name: "EDICIÓN CAMPOS"
    }
])

FieldType.create!([{
        name: "NÚMERICO"
    },
    {
        name: "ALFANUMÉRICO"
    }
])

apison = Organism.create!(
    {
        "code": 140,
        "initials": "APISON",
        "name": "ADMINISTRACIÓN PORTUARIA INTEGRAL DE SONORA, S.A. DE C.V."
    }
)

apison.administrative_units.create!([
    {
        "code": 3298,
        "name": "DIRECCION GENERAL",
        "initials": "DG"
    },
    {
        "code": 3301,
        "name": "GERENCIA DE OPERACIONES E INGENIERIA",
        "initials": "GDOEI"
    },
    {
        "code": 3300,
        "name": "GERENCIA DE COMERCIALIZACION",
        "initials": "GDC"
    }
])

cedes = Organism.create!(
    {
        "code": 2,
        "initials": "CEDES",
        "name": "COMISIÓN DE ECOLOGÍA Y DESARROLLO SUSTENTABLE DEL ESTADO DE SONORA"
    }
)

cedes.administrative_units.create!([
    {
        "code": 2042,
        "name": "DIRECCIÓN GENERAL JURÍDICO Y UNIDAD DE TRANSPARENCIA",
        "initials": "DGJUT",
        "organism_id": 2
    },
    {
        "code": 2031,
        "name": "COMISION DE ECOLOGIA Y DESARROLLO SUSTENTABLE DEL ESTADO DE SONORA",
        "initials": "CEDES",
        "organism_id": 2
    },
    {
        "code": 2034,
        "name": "DIRECCIÓN GENERAL DE ADMINISTRACIÓN Y FINANZAS",
        "initials": "DGAF",
        "organism_id": 2
    },
    {
        "code": 650,
        "name": "DIRECCIÓN GENERAL DE RECURSOS HUMANOS E INFORMÁTICOS ",
        "initials": "DGRHI",
        "organism_id": 2
    },
    {
        "code": 2032,
        "name": "COMISIÓN EJECUTIVA",
        "initials": "CE",
        "organism_id": 2
    },
    {
        "code": 2037,
        "name": "DIRECCIÓN GENERAL DE CAMBIO CLIMÁTICO Y CULTURA AMBIENTAL",
        "initials": "DGCCCA",
        "organism_id": 2
    },
    {
        "code": 2035,
        "name": "DIRECCIÓN GENERAL DE CONSERVACIÓN",
        "initials": "DGC",
        "organism_id": 2
    },
    {
        "code": 2040,
        "name": "DIRECCION GENERAL DEL DELFINARIO",
        "initials": "DGD",
        "organism_id": 2
    },
    {
        "code": 2036,
        "name": "DIRECCIÓN GENERAL DE GESTIÓN  Y POLÍTICA AMBIENTAL",
        "initials": "DGGPA",
        "organism_id": 2
    },
    {
        "code": 2039,
        "name": "DIRECCIÓN GENERAL DEL CENTRO ECOLÓGICO",
        "initials": "DGCE",
        "organism_id": 2
    },
    {
        "code": 850,
        "name": "DIRECCIÓN GENERAL DE PROTECCIÓN Y BIENESTAR ANIMAL",
        "initials": "DGPBA",
        "organism_id": 2
    },
    {
        "code": 2041,
        "name": "ORGANO INTERNO DE CONTROL",
        "initials": "OIC",
        "organism_id": 2
    }
])

catalog = Catalog.create!({
    "name": "Dependencias",
    "description": "Dependencias de Gobierno"
})

data_dictionary = DataDictionary.create!({
    "modification_type_id": ModificationType.first.id,
    "description": "Dependencias de Gobierno",
    "catalog_id": Catalog.first.id,
    "version": "D20240805-1"
})

DataDictionaryField.create!([
    {
        "field_name": "nombre",	
        "field_type_id": FieldType.last.id,	
        "field_description": "Nombre de la dependencia",
        "data_dictionary_id": DataDictionary.first.id
    },
    {
        "field_name": "descripcion",	
        "field_type_id": FieldType.last.id,	
        "field_description": "Descripción de la dependencia",
        "data_dictionary_id": DataDictionary.first.id
    },
    {
        "field_name": "clave",	
        "field_type_id": FieldType.first.id,	
        "field_description": "clave de la dependencia",
        "data_dictionary_id": DataDictionary.first.id
    },
])