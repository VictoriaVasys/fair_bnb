# class SessionsController < ApplicationController
# 
#   def create
#     auth = request.env['omniauth.auth']
#     @identity = Identity.find_with_omniauth(auth)
# 
#     if @identity.nil?
#       @identity = Identity.create_with_omniauth(auth)
#     end
# 
#     if @identity.provider == "facebook"
#       binding.pry
#       if user = User.from_fb_omniauth(auth)
#         session[:user_id] = user.id
#         if current_user.phone_number.nil?
#           redirect_to edit_user_path(user)
#         else
#           redirect_to dashboard_path
#         end
#       end
#     elsif @identity.provider == "google"
#       if user = User.from_google_omniauth(auth)
#         session[:user_id] = user.id
#         if current_user.phone_number.nil?
#           redirect_to edit_user_path(user)
#         else
#           redirect_to dashboard_path
#         end
#       end
#     end
# 
#   end
# 
#   def destroy
#     session[:user_id] = nil
#     redirect_to root_path
#   end
# end
