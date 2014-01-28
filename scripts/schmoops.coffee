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
      response = Math.floor(Math.random() * 3)
      if response == 0
        msg.send "Dance!! It's a schmoopiefest!!"
      else if response == 1
        msg.send "Geez, become coffee pirates already this is getting ridiculous."
      else if response == 2
        msg.send "Fluxy's capacitors have increased due to excess schmoop."
      else
        msg.send "Schmoop. Schmoop de doop. Schmoop de doop. I think there are more doops now."
      robot.brain.set schmoop: 0
    else
      robot.brain.set schmoop: schmoop + 1