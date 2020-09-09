class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      project_index_path
    end

    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.json { head :forbidden, content_type: 'text/html' }
          format.html { redirect_to new_user_session_path, notice: "Please sign in to access the page." }
          format.js   { head :forbidden, content_type: 'text/html' }
        end
      end
end
