require 'Foursquare2'

class HomeController < ApplicationController
  
 def load_venues
    lat = params[:lat]
    lng = params[:lng]
  	puts 'Load venues'
  	client = Foursquare2::Client.new(:client_id => 'YCGWKAG00MWPLIEBBEBG3OQOWAOWHAEJHCQXLVG2DJIAQ4WR', :client_secret => 'TQBALNIDAMHZVBWJKUCA34KSWYVTXFMLS4AJOHQLQGDXPBAD')
    coords = lat + "," + lng
    venues = client.search_venues(:ll => coords)
    items = venues['groups'][0]['items']
    respond_to do |format|
      format.json {render json: items}
    end

  end

  def index	
  	
  	@page_title = 'API'
  	puts 'llamando client venue'
  	
  end

  

end
