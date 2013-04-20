class CharacterClassesController < ApplicationController
  before_action :set_character_class, only: [:show, :edit, :update, :destroy]

  # GET /character_classes
  # GET /character_classes.json
  def index
    @character_classes = CharacterClass.all
  end

  # GET /character_classes/1
  # GET /character_classes/1.json
  def show
  end

  # GET /character_classes/new
  def new
    @character_class = CharacterClass.new
  end

  # GET /character_classes/1/edit
  def edit
  end

  # POST /character_classes
  # POST /character_classes.json
  def create
    @character_class = CharacterClass.new(character_class_params)

    respond_to do |format|
      if @character_class.save
        format.html { redirect_to @character_class, notice: 'Character class was successfully created.' }
        format.json { render action: 'show', status: :created, location: @character_class }
      else
        format.html { render action: 'new' }
        format.json { render json: @character_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_classes/1
  # PATCH/PUT /character_classes/1.json
  def update
    respond_to do |format|
      if @character_class.update(character_class_params)
        format.html { redirect_to @character_class, notice: 'Character class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @character_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_classes/1
  # DELETE /character_classes/1.json
  def destroy
    @character_class.destroy
    respond_to do |format|
      format.html { redirect_to character_classes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_class
      @character_class = CharacterClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_class_params
      params[:character_class]
    end
end
