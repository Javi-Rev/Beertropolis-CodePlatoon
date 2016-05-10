class SessionsController < ApplicationController
  def create
   user = User.find_or_create_by(uid: env['omniauth.auth']['uid'], name: env['omniauth.auth']['info']['name'])
   session[:user_id] = user.id
   redirect_to root_path
 end

 def destroy
   session.destroy
   redirect_to root_path
 end
end
