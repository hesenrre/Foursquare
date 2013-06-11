require 'Foursquare2'

class HomeController < ApplicationController

  def load_venues
    lat = params[:lat]
    lng = params[:lng]
    search = params[:search]

    puts 'Load venues'
    client = Foursquare2::Client.new(:client_id => 'YCGWKAG00MWPLIEBBEBG3OQOWAOWHAEJHCQXLVG2DJIAQ4WR', :client_secret => 'TQBALNIDAMHZVBWJKUCA34KSWYVTXFMLS4AJOHQLQGDXPBAD')
    coords = lat + "," + lng
    radius = 1500

    if search.is_a?(NilClass)
      venues = client.search_venues(:ll => coords, :intent => 'browse', :radius => radius, :limit => 50)
    else
      venues = client.search_venues(:ll => coords, :intent => 'browse', :radius => radius, :limit => 50, :query => search)
    end



    #prueba = client.search_venues_by_tip(:ll => coords, :radius => radius)
    #puts prueba
    items = venues['groups'][0]['items']
    #items.each{|venue| puts venue
    #         puts ""}

    respond_to do |format|
      format.json {render json: items}
    end

  end

  def index

    @page_title = 'API'
    puts 'llamando client venue'

  end



end
