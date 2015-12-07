Meteor.methods
  newgame: (name) ->
    id = Games.insert {
      name: name
      whiteDeck: newDeck('white')
      blackDeck: newDeck('black')
      table:
        cards: []
      players: []
    }

  playCard: (id) ->
    player = Players.findOne(userId: @userId, 'cards._id': id)
    game = Games.findOne(player.gameId)
    card = Cards.findOne(id)
    Games.update(game._id, $addToSet: 'table.cards': card)

  clearTable: (game_id) ->
    Games.update(game_id, $set: 'table.cards': [])

newDeck = (type) ->
  cards = Cards.find({type: type}).fetch()
  cards = _.pluck(cards, '_id')
  _.shuffle(cards)
