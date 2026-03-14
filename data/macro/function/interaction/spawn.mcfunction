# ============================================
# macro:interaction/spawn
# ============================================
# Spawns a minecraft:interaction entity at the
# executor's current position.
#
# INPUT: macro:input
#   tag      : <string>  — Custom entity tag (e.g. "shop_button")
#   width    : <number>  — Hitbox width  (e.g. 1 or 1.5f)
#   height   : <number>  — Hitbox height (e.g. 1 or 2.0f)
#   response : <bool>    — Play sound on use? (1b = yes, 0b = no)
#
# EXAMPLE:
#   data modify storage macro:input tag      set value "shop_button"
#   data modify storage macro:input width    set value 1
#   data modify storage macro:input height   set value 1
#   data modify storage macro:input response set value 0b
#   execute at @s run function macro:interaction/spawn with storage macro:input {}
# ============================================

# Spawn with a temporary marker tag so we can reliably tag it afterwards
$summon minecraft:interaction ~ ~ ~ {width:$(width), height:$(height), response:$(response), Tags:["macro.interaction","macro.ia_new"]}

# Apply the user-defined tag and remove the temporary marker
$tag @e[type=minecraft:interaction,tag=macro.ia_new,limit=1,sort=nearest] add $(tag)
tag @e[tag=macro.ia_new] remove macro.ia_new

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"interaction/spawn ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(tag)","color":"white"},{"text":" spawned","color":"#555555"}]
