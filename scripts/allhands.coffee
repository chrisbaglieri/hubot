# Description:
#   Holds all the questions of the world, and randomly asks members of a room to answer them.
#
# Commands:
#   hubot allhands record blah blah blah - records a completed task
#   hubot allhands show - shows the weeks completed tasks
#
# Examples:
#   hubot allhands record i did stuff

module.exports = (robot) ->

  robot.respond /allhands record (.*)$/i, (msg) ->
    task = msg.match[1].trim()
    moment = require('moment')
    key = 'tasks_' + moment().format("YYYYWW")
    tasks = robot.brain.get(key) or ""
    if tasks.length is 0
      robot.brain.set key, task
    else
      tasks += "|" + task
      robot.brain.set key, tasks
    response = Math.floor(Math.random() * 6)
    if response == 0
      msg.send "I got it! Keep it up, you're doing great!"
    else if response == 1
      msg.send "Oooooo, nice, I know that was a doozy!"
    else if response == 2
      msg.send "You're really going to count that as a task?! Fine, I won't judge."
    else if response == 3
      msg.send "Yay!!!!"
    else if response == 4
      msg.send "Phew, that was a tough one."
    else
      msg.send "You must need a nap."

  robot.respond /allhands$/i, (msg) ->
    moment = require('moment')
    key = 'tasks_' + moment().format("YYYYWW")
    tasks = robot.brain.get(key) or ""
    if tasks.length is 0
      msg.send "You had a terribly unproductive week"
    else
      msg.send "\n" + tasks.replace("|", "\n")
            
