# ============================================
# macro:perm/trigger/bind
# ============================================
# Named trigger'e dif-function binds.
# Scoreboard objective if missing automatically createur.
# perm_trigger_names listne {name:"..."} as saves.
#
# INPUT: macro:input { name:"<trigger_adi>", value:<int>, func:"<namespopene:path>", perm:"<permission>" }
#
# EXAMPLE:
# data modify storage macro:input name set value "test"
# data modify storage macro:input value set value 1
# data modify storage macro:input func set value "mypopenk:shop/open"
# data modify storage macro:input perm set value "player"
# function macro:perm/trigger/bind with storage macro:input {}
# → Player types: /trigger test set 1
# ============================================

$scoreboard objectives add $(name) trigger

$execute unless data storage macro:engine perm_triggers.$(name) run data modify storage macro:engine perm_triggers.$(name) set value []
$data modify storage macro:engine perm_triggers.$(name) append value {value:$(value), func:"$(func)", perm:"$(perm)"}

# Add to perm_trigger_names (duplicate prevention — object format)
execute unless data storage macro:engine perm_trigger_names run data modify storage macro:engine perm_trigger_names set value []
$execute unless data storage macro:engine perm_trigger_names[{name:"$(name)"}] run data modify storage macro:engine perm_trigger_names append value {name:"$(name)"}

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/trigger/bind ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(name)","color":"white"},{"text":":","color":"#555555"},{"text":"$(value)","color":"yellow"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"},{"text":" [","color":"#555555"},{"text":"$(perm)","color":"green"},{"text":"]","color":"#555555"}]
