# ============================================
# macro:dialog/load  [1.21.6 — native dialog]
# ============================================
# Starts a loading dialog with the given cooldown (ticks).
#
# INPUT: macro:input { cooldown:<int> }   (default: 20 ticks)
# ============================================

execute unless data storage macro:input cooldown run data modify storage macro:input cooldown set value 20
$scoreboard players set @s macro.dialog_load $(cooldown)
tag @s remove macro.dialog_opened
tag @s add macro.dialog_opened
dialog show @s macro:loading
tag @s add macro.dialog_closed
