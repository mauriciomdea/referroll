class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  private

	  def set_locale
		  I18n.locale = extract_locale_from_tld || I18n.default_locale
		end

		# Get locale from top-level domain or return nil if such locale is not available
		def extract_locale_from_tld
		  # parsed_locale = request.host.split('.').last
		  # I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
		  parsed_locale = request.host.split('.').last == 'br' ? :pt_BR : nil
		end

	  def current_user
	    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	  end

	  def signed_in?
	    !!current_user
	  end

	  helper_method :current_user, :signed_in?

	  def current_user=(user)
	    @current_user = user
	    session[:user_id] = user.nil? ? user : user.id
	  end

end
