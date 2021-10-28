class ApplicationController < ActionController::Base
    # before_action :authenticate_user!, only: [:homes]
    before_action :authenticate_user!,except: [:top, :about]
    # アクセス権限の実装のために追加Homesには追加。
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    private
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email]) # 注目
    end
    
    def after_sign_up_path_for(resource)
      user_path (resource)
    end
    
    def after_sign_in_path_for(resource)
      user_path (resource)
    end

    def after_sign_out_path_for(resource)
      root_path
    end
end