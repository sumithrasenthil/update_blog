module Api
    module V1
        class UsersController < ApplicationController
            def index 
                users =User.all
                render json: {data:users}
            end
            def show
                user =User.find(params[:id])
                render json: {data:user}
            end


        end

    end

end
