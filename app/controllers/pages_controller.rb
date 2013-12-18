class PagesController < ApplicationController

  def home
  end

  def calendar
  end

  def contact
  end

  def training
    @users = User.all
  end
end
