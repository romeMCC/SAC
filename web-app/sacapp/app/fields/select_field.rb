require "administrate/field/base"

class SelectField < Administrate::Field::Base
  def to_s
    data
  end

  def choices
    options.fetch(:choices, [])
  end
end