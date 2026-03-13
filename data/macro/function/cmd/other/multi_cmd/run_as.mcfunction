# ============================================
# macro:cmd/other/multi_cmd/run_as
# ============================================
# _mcmd_list inside commands specified player
# AS ve playernun at the location of runs.
#
# INPUT (makro): macro:input { player:"<player_adi>" }
# PREREQUISITE: macro:engine _mcmd_list must be filled
#
# KULLANIM:
# data modify storage macro:engine _mcmd_list set value ["count Merhaba!", "give @s apple 1"]
# data modify storage macro:input player set value "Steve"
# function macro:cmd/other/multi_cmd/run_as with storage macro:input {}
# ============================================

$execute as @a[name=$(player),limit=1] at @s run function macro:cmd/other/multi_cmd/run
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/other/multi_cmd/run_as ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" ▶ done","color":"green"}]
