# ============================================
# macro:cmd/other/multi_cmd/run_func
# ============================================
# _mcmd_list functions inside (namespace:path)
# runs in sequence.
#
# KULLANIM:
# data modify storage macro:engine _mcmd_list set value ["mypopenk:phase1", "mypopenk:phase2", "mypopenk:phase3"]
# function macro:cmd/other/multi_cmd/run_func
#
# NOTE: Function paths are expected, not command strings.
# For commands: macro:cmd/other/multi_cmd/run
# ============================================

function macro:cmd/other/multi_cmd/internal/step_func
data remove storage macro:engine _mcmd_list
data remove storage macro:engine _mcmd_entry
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/other/multi_cmd/run_func ","color":"aqua"},{"text":"✔ func batch done","color":"green"}]
