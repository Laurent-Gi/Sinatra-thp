require 'csv'

class Gossip
  attr_accessor :author, :content
  @@csv_file = "./db/gossip.csv"

def initialize(author, content)
  @author  = author
  @content = content
end

def save
  CSV.open(@@csv_file, "ab") do |csv|
    csv << [@author, @content]
  end
end

def self.all
  all_gossips = Array.new

  CSV.read(@@csv_file).each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
end

def self.find(id)
  gossips = Array.new   # initialisation d'un array pour récupérer le potin d'index id
  CSV.read(@@csv_file).each_with_index do |csv_line, index|
    if (id == index+1)          # Dès que l'index+1 correspond au numéro de potin recherché, on le place dans le tableau 
      gossips << Gossip.new(csv_line[0], csv_line[1])
      break
    end
  end
  return gossips # On renvoie le potin dans le tableau
end

def self.update(index_to_modify, author, content)
  gossips = Array.new   # initialisation d'un array pour ré-écrire les potins avec la modif du potin n° index_to_modify

  # On ne modifie que le potin de "index_to_modify"
    CSV.read(@@csv_file).each_with_index do |csv_line, index|
      if index_to_modify == index+1
        gossips << [author, content]
      else
        gossips << [csv_line[0], csv_line[1]]
      end
    end

    # On va overwriter en mode "w" - Tout simplement on restitue gossips (tableau des gossip pour csv)
    CSV.open(@@csv_file, "w") do |csv_gossip_line|
      gossips.each do |line|
        csv_gossip_line << line
      end
    end
  end

end
