require 'gossip'

class ApplicationController < Sinatra::Base
  # Affiche tous les potins, en passant le tableau de tous les gossip
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  # créer un potin (gossip)
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    # création d'un nouveau potin en utilisans les données du formulaire et sauvegarde dans la db (.csv)
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end

  # créer une page dynamique par numéro de potin /gossips/n
  get '/gossips/:id' do
    erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  # éditer un potin (gossip) en dynamique
  get '/gossips/:id/edit/' do
    erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  # Et modifier un potin édité : méthode post
  post '/gossips/:id/edit/' do
    Gossip.update(params['id'].to_i,params["gossip_author"], params["gossip_content"])
    redirect '/'
  end

end