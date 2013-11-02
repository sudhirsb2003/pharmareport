class TabUsersController < ApplicationController
  before_action :set_tab_user, only: [:show, :edit, :update, :destroy]

  # GET /tab_users
  # GET /tab_users.json
  def index
    @tab_users = TabUser.all
  end

  # GET /tab_users/1
  # GET /tab_users/1.json
  def show
  end

  # GET /tab_users/new
  def new
    @tab_user = TabUser.new
  end

  # GET /tab_users/1/edit
  def edit
  end

  # POST /tab_users
  # POST /tab_users.json
  def create
    @tab_user = TabUser.new(tab_user_params)

    respond_to do |format|
      if @tab_user.save
        format.html { redirect_to @tab_user, notice: 'Tab user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tab_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @tab_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tab_users/1
  # PATCH/PUT /tab_users/1.json
  def update
    respond_to do |format|
      if @tab_user.update(tab_user_params)
        format.html { redirect_to @tab_user, notice: 'Tab user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tab_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tab_users/1
  # DELETE /tab_users/1.json
  def destroy
    @tab_user.destroy
    respond_to do |format|
      format.html { redirect_to tab_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tab_user
      @tab_user = TabUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tab_user_params
      params.require(:tab_user).permit(:name, :address, :employee_uid,:photo)
    end
end
