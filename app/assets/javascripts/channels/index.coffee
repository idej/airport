#= require cable
#= require_self
#= require_tree .

@App ||= {}
App.cable = Cable.createConsumer "ws://#{location.hostname}:28080"
