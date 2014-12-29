class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
  end

  def about
  end

  def contact
  end

  def faq
  end

  def terms
  end

  def admin
  end
  
end
