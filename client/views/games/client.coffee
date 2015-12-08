Template.gamesClient.helpers
  cards: ->
    ids = Players.findOne(userId: Meteor.userId())?['cards']
    if ids
      Cards.find(_id: $in: ids).fetch()

Template.gamesClient.events
  'click .card-panel': (e) ->
    Meteor.call('playCard', this._id)
