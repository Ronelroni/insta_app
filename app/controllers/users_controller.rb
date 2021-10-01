class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create, :edit]
    def new
        @user = User.new
    end
    def index
        @users = User.all
      end
    def edit
        @user = User.find(params[:id])
    end
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user.id)
          else
            render :new
          end
      end
      def show
        @user = User.find(params[:id])
      end

     # PATCH/PUT /users/1 or /users/1.json
    def update
        @user = User.find(params[:id])
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: "User was successfully updated." }
                format.json { render :show, status: :ok, location: @user }
              else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
              end
          end
    end
    
    private
    def set_user
        @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :image, :image_cache,
                                     :password_confirmation)
    end
end