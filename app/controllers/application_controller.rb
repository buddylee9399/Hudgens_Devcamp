class ApplicationController < ActionController::Base
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    include DeviseWhitelist
    # include SetSource    
    include CurrentUserConcern    
    include DefaultPageContent    
    private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_back(fallback_location: root_path)
    end     
end
