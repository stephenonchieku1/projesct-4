class UsersController < ApplicationController
      def index
        user=User.all
        render json: user
      end
    
    # GET /users/{}
    def show
        user = User.find_by(id: params[:id])
        if user
        render json: user, status: :created
        else
        render json: {error: "Not authorized"}.to_json, status: :unauthorized
        end
    end
    
      # POST /users
    def create 
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}.to_json, status: :unprocessable_entity
        end
  
    end
  
    
      private
  
    
      def user_params
        params.permit(
           :full_name, :email, :password, :password_confirmation, :role
        )
      end
  
end
