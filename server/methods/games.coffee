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
    player = Players.findOne(userId: @userId, cards: id)
    game = Games.findOne(player.gameId)
    # card = Cards.findOne(id)
    Games.update(game._id, $addToSet: 'table.cards': id)
    Players.update(player._id, $pull: cards: id)

  clearTable: (game_id) ->
    Games.update(game_id, $set: 'table.cards': [])

  newRound: (game_id) ->
    game = Games.findOne(game_id)
    players = Players.find(_id: $in: game.players)
    players.forEach (p) ->
      num = 10 - p.cards.length
      cards = game.whiteDeck[0...num]
      Players.update(p, $addToSet: cards: $each: cards)
      Games.update(game, $pull: whiteDeck: $in: cards )

      # for [p.cards.length...10]
      #   console.log('adding 1 card')
      #   c = game.whiteDeck[0]
      #   Players.update(p, $addToSet: cards: c)
      #   Games.update(game, $pop: whiteDeck: '-1')

newDeck = (type) ->
  cards = Cards.find({type: type}).fetch()
  cards = _.pluck(cards, '_id')
  _.shuffle(cards)
