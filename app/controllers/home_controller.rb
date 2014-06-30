# encoding: UTF-8
class HomeController < ApplicationController
  
  def index
  	render layout: 'public'
  end

  def sign_in
  	# render layout: 'application'
  end

end