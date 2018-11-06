class RegistrationsController < Devise::RegistrationsController

private

  def sign_up_params
    params.require(:user).permit(:first_name, 
                                 :last_name, 
                                 :email, 
                                 :password, 
                                 :password_confirmation, 
                                 :username,
                                 :subdomain)
  end

  def account_update_params
    params.require(:user).permit(:first_name, 
                                 :last_name, 
                                 :email, 
                                 :password, 
                                 :password_confirmation, 
                                 :current_password, 
                                 :username,
                                 :subdomain)
  end

end