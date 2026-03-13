# ============================================
# macro:cmd/other/multi_cmd/from_input
# ============================================
# macro:input.list'teki command listni okuyup runs.
# Convenience wrapper — no need to manually set _mcmd_list.
#
# KULLANIM:
# data modify storage macro:input list set value ["count Merhaba", "give @s diamond 1"]
# function macro:cmd/other/multi_cmd/from_input
#
# NOTE: List must be inside macro:input.list (list key).
# ============================================

data modify storage macro:engine _mcmd_list set from storage macro:input list
function macro:cmd/other/multi_cmd/run
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/other/multi_cmd/from_input ","color":"aqua"},{"text":"▶ list → run","color":"#555555"}]
