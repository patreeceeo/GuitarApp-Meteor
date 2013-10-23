

Meteor.startup ->
  if Meteor.isClient
    Template['home'].greeting = ->
      "Hello there"

    Template.home?.events
    'click input' : ->

Router.configure
  layout: 'layout'

Router.map ->
  @route 'home', 
    path: '/'
    renderTemplates: 
      footer: to: 'footer'
  @route 'profile'
