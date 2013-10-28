assert = require 'assert'

describe 'Profiles', ->

  it 'creates profiles', (done, server) ->
    server.eval ->
      Profiles.insert username: 'phatty'
      docs = Profiles.find().fetch()
      emit 'docs', docs

    server.once 'docs', (docs) ->
      assert.equal docs.length, 1
      done()

  it 'provides a default image', (done, server, client) ->
    client.eval ->
      Profiles.find().observe
        added: (profile) ->
          emit 'profile', profile
      Meteor.call('profile/create', {})

    client.once 'profile', (profile) ->
      $ = global.Package.jquery.$
      assert(profile.imageURL)
      $.get profile.imageURL, (data) ->
        assert(data)
        done()





