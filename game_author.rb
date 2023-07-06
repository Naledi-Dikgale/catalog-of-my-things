# Class Author 
#     attr_reader :games, :authors

#     def initialize(games, authors)
#         @games = []
#         @authors = []
#         # load_data
#     end

#     def to_hash
#         {
#             games: @games.map(&:to_hash),
#             authors: @authors.map(&:to_hash)
#         }
#     end

#     can_be_archived?
#         super || (Date.today - Date.parse(@last_played_at) > 365 * 2)
#     end
#     end

class GameAuthor
    attr_accessor :firstname, :lastname, :items
    attr_reader :id
  
    def initialize(firstname, lastname)
      @id = rand(1...1000)
      @firstname = firstname
      @lastname = lastname
      @items = []
    end
  
    def add_item(item)
      @items << item
      item.author = self
    end
  
    def to_hash
      {
        id: @id,
        firstname: @firstname,
        lastname: @lastname,
        items: @items.map(&:to_hash)
      }
    end
  end