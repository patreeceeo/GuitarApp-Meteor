

Meteor.startup ->
  # if Meteor.isClient
    # Template['home'].greeting = ->
    #   "Hello there"

    # Template.home?.events
    # 'click input' : ->

Router.configure
  layout: 'timeline-layout'

Router.map ->
  @route 'timeline',
    path: '/'
    renderTemplates:
      'heavy-rotation': to: 'heavy-rotation'
      'next-level': to: 'next-level'
      'demos': to: 'demos'
      'usercard': to: 'usercard'
      'global-controls': to: 'global-controls'
      'timeline': to: 'timeline'
  @route 'profile'
