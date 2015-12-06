Template.gamesClient.helpers
  cards: ->
    Players.findOne(userId: Meteor.userId())?['cards']

Template.gamesClient.events
  'click .card-panel': (e) ->
    Meteor.call('playCard', this._id)
