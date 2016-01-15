class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(user)
      venues_path
    end
end
