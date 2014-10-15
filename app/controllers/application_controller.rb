class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def default_datebodydata_param_keys
    %w(date_search per_date_search)
  end

  def datebodydata_params(*param_keys)
    overwrites = param_keys.extract_options!
    param_keys = default_datebodydata_param_keys if param_keys.blank?
    params.dup.extract!(*param_keys).update(overwrites)
  end
  helper_method :datebodydata_params
end
