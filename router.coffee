Router.configure
  layoutTemplate: 'layout'

Router.route '/', ->
  render('home')

Router.route '/games', name: 'games.index', data: ->
  Games.find()

Router.route '/games/:_id/client', name: 'games.client', data: ->
  Games.findOne(_id: @params._id)

Router.route '/games/:_id/table', name: 'games.table', data: ->
  Games.findOne(_id: @params._id)
