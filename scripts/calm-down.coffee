# Description:
#   Calm down
#
# Commands:
#   hubot calm me | manatee me - Reply with Manatee
#   calm down | simmer down | that escalated quickly - Reply with Manatee
#   ALL CAPS | LONGCAPS - Reply with Manatee

module.exports = (robot) ->
  manatee = ->
    num = Math.floor(Math.random() * 30) + 1
    "http://calmingmanatee.com/img/manatee#{ num }.jpg"

  robot.respond /manatee|calm( me)?/i, (msg) -> msg.send manatee()