class TwitterProfilesController < ApplicationController

  def index
    @twitter_profiles = TwitterProfile.all
    render 'index'
  end

  def show
    @twitter_profile = TwitterProfile.find(params[:id])
    render 'show'
  end

  def new
    @twitter_profile = TwitterProfile.new
    render 'new'
  end

  def edit
    @twitter_profile = TwitterProfile.find(params[:id])
    render 'edit'
  end

  def create
    @twitter_profile = TwitterProfile.new(twitter_profile_params)

    if @twitter_profile.save
      redirect_to @twitter_profile, notice: 'Twitter profile was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @twitter_profile = TwitterProfile.find(params[:id])
    if @twitter_profile.update(twitter_profile_params)
      redirect_to @twitter_profile, notice: 'Twitter profile was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @twitter_profile = TwitterProfile.find(params[:id])
    @twitter_profile.destroy
    redirect_to twitter_profiles_url, notice: 'Twitter profile was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def twitter_profile_params
    params.require(:twitter_profile).permit(:name, :description, :picture, :latest_tweet)
  end

end
