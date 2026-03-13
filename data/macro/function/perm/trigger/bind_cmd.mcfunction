# ============================================
# macro:perm/trigger/bind_cmd
# ============================================
# Named trigger'e dif-command binds (function not).
#
# INPUT: macro:input { name:"<trigger_adi>", value:<int>, cmd:"<command>", perm:"<permission>" }
# ============================================

$scoreboard objectives add $(name) trigger

$execute unless data storage macro:engine perm_triggers.$(name) run data modify storage macro:engine perm_triggers.$(name) set value []
$data modify storage macro:engine perm_triggers.$(name) append value {value:$(value), cmd:"$(cmd)", perm:"$(perm)"}

execute unless data storage macro:engine perm_trigger_names run data modify storage macro:engine perm_trigger_names set value []
$execute unless data storage macro:engine perm_trigger_names[{name:"$(name)"}] run data modify storage macro:engine perm_trigger_names append value {name:"$(name)"}

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/trigger/bind_cmd ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(name)","color":"white"},{"text":":","color":"#555555"},{"text":"$(value)","color":"yellow"},{"text":" → ","color":"#555555"},{"text":"$(cmd)","color":"aqua"},{"text":" [","color":"#555555"},{"text":"$(perm)","color":"green"},{"text":"]","color":"#555555"}]
