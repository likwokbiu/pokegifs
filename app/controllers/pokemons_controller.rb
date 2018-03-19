require 'json'

class PokemonsController < ApplicationController
  def index
  end

  def show
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(res.body)
    name = body["name"]
    id = body["id"]
    type = body["types"][0]["type"]["name"]
    res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["POKEMON_API_KEY"]}&q=#{name}&rating=g")
    gif_body = JSON.parse(res.body)
    gif_url = gif_body["data"][0]["url"]
    render json: { "id": id, "name": name, "types": [type], "gif": gif_url }
  end
end
