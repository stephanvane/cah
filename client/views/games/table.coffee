Template.gamesTable.helpers
  cards: ->
    @table?.cards

Template.gamesTable.events
  'click .btn.clear': (e) ->
    Meteor.call('clearTable', @_id)
