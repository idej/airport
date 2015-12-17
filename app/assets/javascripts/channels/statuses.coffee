@App ||= {}

App.statuses = App.cable.subscriptions.create "StatusesChannel",
  received: (data) ->
    $("#plane_#{data.plane_id} > td.select").empty() if data.status != 'ready'
    $("#plane_#{data.plane_id} > td.state").html(data.state)
    $("#plane_#{data.plane_id} > td.history").html(data.history.join(' - '))
