class EmberController < ApplicationController

  def index
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        redirect_to '/?locale=' + I18n.default_locale.to_s
      end
    end
  end
end
