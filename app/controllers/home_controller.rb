class HomeController < ApplicationController
  def index
  end

  def about
    render template: "home/about"
  end
end
