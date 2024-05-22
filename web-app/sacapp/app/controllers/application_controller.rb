class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :authenticate_user!

  before_action do   
    I18n.locale = :es # Or whatever logic you use to choose.
  end

  protected

  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end
end
