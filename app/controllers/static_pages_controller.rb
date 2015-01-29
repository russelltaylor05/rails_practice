class StaticPagesController < ApplicationController
  def home
    
    @russell = {name: "russell", ocupation: "developer"}
  end

  def help
  end

  def about
  end

  def contact
  end

end
