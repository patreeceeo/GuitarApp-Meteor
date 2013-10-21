root = global ? window


root.Meteor.startup ->
  if root.Meteor.isClient
    root.Template['hello'].greeting = ->
      "Hello there"
    root.Template['chord-diagram'].greeting = ->
      "Welcome to GuitarApp-Meteor."

    root.Template.hello?.events
    'click input' : ->
      # // template data, if any, is available in 'this'
      if console?
        console.log("You pressed the button");
    # // code to run on server at startup
