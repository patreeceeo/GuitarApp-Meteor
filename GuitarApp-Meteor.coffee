

@Meteor.startup ->
  if @Meteor.isClient
    @Template['hello'].greeting = ->
      "Hello there"
    @Template['chord-diagram'].greeting = ->
      "Welcome to GuitarApp-Meteor."

    @Template.hello?.events
    'click input' : ->
