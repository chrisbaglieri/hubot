# Description:
#   Keeps tabs of schmoopieness, engages in schmoopiefest when you hit limits
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   ([pummel]|[awww]) - Records schmoopie, engages in schmoopiefest when you hit the limit

module.exports = (robot) ->

  robot.hear /\[pummel\]|\[aw+\]/i, (msg) ->
    schmoop = robot.brain.get('schmoop') or 1
    if schmoop >= 10
      msg.send "Dance!! It's a schmoopiefest!!"
      robot.brain.set schmoop: 0
    else
      robot.brain.set schmoop: schmoop + 1