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
    render json: { "id": id, "name": name, "types": [type] }
  end
end
