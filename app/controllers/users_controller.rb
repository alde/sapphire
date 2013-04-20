class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.xml
  # GET /users.json                                       HTML and AJAX
  #-----------------------------------------------------------------------
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.xml
  # GET /users/1.json                                     HTML AND AJAX
  #-------------------------------------------------------------------
  def show
  end

  # GET /users/new
  # GET /users/new.xml
  # GET /users/new.json                                    HTML AND AJAX
  #-------------------------------------------------------------------
  def new
    @user = User.new
  end

  # GET /users/1/edit
  # GET /users/1/edit.xml
  # GET /users/1/edit.json                                HTML AND AJAX
  #-------------------------------------------------------------------
  def edit
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  # DELETE /users/1.json                                  HTML AND AJAX
  #-------------------------------------------------------------------
  def destroy
    @user.destroy!

    respond_to do |format|
      format.json { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
      format.html { respond_to_destroy(:html) }
    end

    rescue ActiveRecord::RecordNotFound
      respond_to_not_found(:json, :xml, :html)
  end

  # POST /users
  # POST /users.xml
  # POST /users.json                                      HTML AND AJAX
  #-----------------------------------------------------------------
  def create
    @user = User.new(params[:user])

    if @user.save
      respond_to do |format|
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { redirect_to :action => :index }
      end
    else
      respond_to do |format|
        format.json { render :text => "Could not create user", :status => :unprocessable_entity } # placeholder
        format.xml  { head :ok }
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
end
