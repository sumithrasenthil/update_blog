module Api
    module V1
        class UsersController < ApplicationController
            before_action :doorkeeper_authorize!
            skip_before_action :authenticate_user!
            protect_from_forgery with: :null_session
            def index
                
                users =User.order('Created_at DESC');
                render json: {message:'Users',data:users}
            end
            def show
                user =User.find(params[:id])
                render json: {data:user}
            end
            def new
                user=User.new
            end

            def create
                user =User.new(user_params)
                if user.save
                    render json: {data:user}
                else
                    render json: {data:user.errors}
                end
            end

            def update
                user=User.find(params[:id])
                if user.update(user_params)
                    render json: {status: :'Success',message:'User updated',data:user}
                else
                    render json: {data:user.errors}
                end
            end

            def destroy
                user=User.find(params[:id])
                if user.destroy
                    render json: {status: :'Success',message:'user deleted',data:user}
            end
        end


            private
            def user_params
                params.require(:user).permit(:firstname,:lastname,:email,:password,:password_cofirmation)
            end

        end

    end

end
