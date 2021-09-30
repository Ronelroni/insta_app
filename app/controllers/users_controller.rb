class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]
    def new
        @user = User.new
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
        respond_to do |format|
            if @user.update(post_params)
              format.html { redirect_to @user, @user.name, @user.email }
            else
              format.html { render :edit, status: :unprocessable_entity }
            end
          end
    end
    
    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :image, :image_cache,
                                     :password_confirmation)
    end
end