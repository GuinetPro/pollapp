class Api::V1::UsersController < Api::V1::MasterApiController
    # POST /users
    def create
        #params = { auth:{ provider: 'facebook', uid:'12adsashd71' } }

        if !params[:auth]
            render json: { error: "No encontramos el parámetro Auth" }
        else
            @user = User.from_omniauth(params[:auth])
            @token = @user.tokens.create(my_app: @my_app) #siempre pasamos my_app pq viene de master

            render "api/v1/users/show"
        end

    end

end