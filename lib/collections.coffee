# Cards
@Cards = new Mongo.Collection 'cards'
cardSchema = new SimpleSchema
  type:
    type: String
    allowedValues: ['white', 'black']
  text:
    type: String
  set:
    type: String
    allowedValues: ['basic']
    defaultValue: 'basic'
# @Cards.attachSchema(cardSchema)

# Players
@Players = new Mongo.Collection 'players'
playerSchema = new SimpleSchema
  name:
    type: String
    max: 50
  cards:
    type: [cardSchema]
  userId:
    type: 'String'
    regEx: SimpleSchema.RegEx.Id
  gameId:
    type: 'String'
    regEx: SimpleSchema.RegEx.Id
    optional: true
# @Players.attachSchema(playerSchema)

# Games
@Games = new Mongo.Collection 'games'
gameSchema = new SimpleSchema
  name:
    type: String
    max: 50
  whiteDeck:
    type: [Object]
    blackbox: true
  blackDeck:
    type: [Object]
    blackbox: true
  table:
    type: Object
  'table.cards':
    type: [cardSchema]
  players:
    type: [String]
    regEx: SimpleSchema.RegEx.Id
# @Games.attachSchema(gameSchema)
