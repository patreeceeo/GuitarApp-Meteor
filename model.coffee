
@Profiles = new Meteor.Collection "profiles"

Profiles.allow
  insert: (userId, profile) ->
    false # no cowboy inserts

  update: (userId, profile, fields, modifier) ->
    if userId isnt profile.owner
      false # not the owner

    allowed = [] # add names of forbidden fields here
    if _.difference(fields, allowed).length
      false # tried to write to forbidden field

    true

  remove: (userId, profile) ->
    party.owner is userId

# Add (client?) model methods here

createProfile = (options) ->
  Meteor.call 'profile/create', options

Meteor.methods
  # Add (server?) model methods here
  'profile/create': (options) ->
    # check(options);

    id = options._id or Profiles.length
    Profiles.insert
      _id: id
      owner: this.userId
    id

