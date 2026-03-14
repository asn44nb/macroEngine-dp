# ============================================
# macro:interaction/remove
# ============================================
# Kills all interaction entities with the given tag.
# Does NOT remove the associated binds — call
# unbind_attack / unbind_use separately if needed.
#
# INPUT: macro:input
#   tag : <string> — Entity tag to kill
#
# EXAMPLE:
#   data modify storage macro:input tag set value "shop_button"
#   function macro:interaction/remove with storage macro:input {}
# ============================================

$kill @e[type=minecraft:interaction,tag=$(tag)]

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"interaction/remove ","color":"aqua"},{"text":"✘ ","color":"red"},{"text":"$(tag)","color":"white"},{"text":" killed","color":"#555555"}]
