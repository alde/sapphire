class CharacterRewardsController < ApplicationController
  before_action :set_character_reward, only: [:show, :edit, :update, :destroy]

  # GET /character_rewards
  # GET /character_rewards.json
  def index
    @character_rewards = CharacterReward.all
  end

  # GET /character_rewards/1
  # GET /character_rewards/1.json
  def show
  end

  # GET /character_rewards/new
  def new
    @character_reward = CharacterReward.new
  end

  # GET /character_rewards/1/edit
  def edit
  end

  # POST /character_rewards
  # POST /character_rewards.json
  def create
    @character_reward = CharacterReward.new(character_reward_params)

    respond_to do |format|
      if @character_reward.save
        format.html { redirect_to @character_reward, notice: 'Character reward was successfully created.' }
        format.json { render action: 'show', status: :created, location: @character_reward }
      else
        format.html { render action: 'new' }
        format.json { render json: @character_reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_rewards/1
  # PATCH/PUT /character_rewards/1.json
  def update
    respond_to do |format|
      if @character_reward.update(character_reward_params)
        format.html { redirect_to @character_reward, notice: 'Character reward was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @character_reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_rewards/1
  # DELETE /character_rewards/1.json
  def destroy
    @character_reward.destroy
    respond_to do |format|
      format.html { redirect_to character_rewards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_reward
      @character_reward = CharacterReward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_reward_params
      params[:character_reward]
    end
end
