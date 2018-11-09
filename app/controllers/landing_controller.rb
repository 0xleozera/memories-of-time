class LandingController < ApplicationController
  def index
    redirect_to(memories_path) if user_signed_in?
  end
end
