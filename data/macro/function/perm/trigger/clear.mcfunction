# ============================================
# macro:perm/trigger/clear
# ============================================
# Clears all binds of the named trigger.
# Scoreboard objective is not removed — only bind list is cleaned.
#
# INPUT: macro:input { name:"<trigger_adi>" }
# ============================================

$data remove storage macro:engine perm_triggers.$(name)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/trigger/clear ","color":"aqua"},{"text":"⚠ ","color":"yellow"},{"text":"$(name)","color":"white"},{"text":" — all binds cleanndi","color":"#555555"}]
