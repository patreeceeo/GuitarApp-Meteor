assert = require 'assert'

describe 'Profiles', ->
  it 'creates profiles', (done, server) ->
    server.eval ->
      Profiles.insert title: 'hello title'
      docs = Profiles.find().fetch()
      emit 'docs', docs

    server.once 'docs', (docs) ->
      assert.equal docs.length, 1
      done()
