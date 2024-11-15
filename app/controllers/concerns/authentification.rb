module Authentification
  extend ActiveSupport::Concern

  included do
    before_action :authenticate!

    helper_method :sign_in?

    def sign_in?
      authenticate.is_a?(Session)
    end

    private

    def authenticate!
      redirect_to sign_in_path unless sign_in?
    end

    def authenticate
      return unless cookies.signed[:session_token]
      return Current.session if Current.session

      Current.session = Session.find_by_id(cookies.signed[:session_token])
    end
  end
end
