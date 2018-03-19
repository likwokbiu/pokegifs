require 'json'

class PokemonsController < ApplicationController
  def index
  end

  def show
    render json: { "message": "ok" }
  end
end
