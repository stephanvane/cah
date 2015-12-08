Template.gamesTable.helpers
  cards: ->
    ids = @table?.cards
    if ids
      Cards.find(_id: $in: ids).fetch()

Template.gamesTable.events
  'click .btn.clear': (e) ->
    Meteor.call('clearTable', @_id)
  'click .btn.newRound': (e) ->
    Meteor.call('newRound', @_id)
