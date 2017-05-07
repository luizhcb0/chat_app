class RoomsController < ApplicationController
  include SessionsHelper
  require "uri"
  require "net/http"
  require 'cgi'
  
  def index
    @messages = Message.all
  end
  
  def translate  
    dialect = current_user.dialect.name
    text = params[:text]

    uri = URI('http://www.degraeve.com/cgi-bin/babel.cgi')
    params = { :w => text, :d => dialect }
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)

    render inline: response.body.html_safe, layout: false if response.is_a?(Net::HTTPSuccess)
    
  end

end
