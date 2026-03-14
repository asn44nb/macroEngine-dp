# ============================================
# macro:interaction/bind_attack
# ============================================
# Registers a function to be called when a player
# ATTACKS (left-click) an interaction entity with
# the given tag. The function fires AS the attacking player.
#
# Multiple binds for the same tag are all called in order.
# Multiple different tags can be bound to the same function.
#
# INPUT: macro:input
#   tag  : <string> — Entity tag to listen for
#   func : <string> — Function to run (namespace:path)
#
# EXAMPLE:
#   data modify storage macro:input tag  set value "shop_button"
#   data modify storage macro:input func set value "mypack:shop/on_attack"
#   function macro:interaction/bind_attack with storage macro:input {}
# ============================================

$data modify storage macro:engine interaction_binds.attack append value {tag:"$(tag)", func:"$(func)"}

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"interaction/bind_attack ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(tag)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]
