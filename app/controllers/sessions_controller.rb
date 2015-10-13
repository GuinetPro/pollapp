class SessionsController < ApplicationController


def create

    auth = request.env["omniauth.auth"]
    user = User.from_omniauth(auth)
     #raise auth.to_yaml

    #persiste devuelve verdadero cuando el objeto ya esta guardado
    if user.persisted?
        #sesion es global de rails
        session[:user_id] = user.id
        redirect_to "/", notice: "Ya estás logueado"
    else
        redirect_to "/", notice: user.errors.full_messages.to_s
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to "/", notice: "Hasta luego"
  end


end
