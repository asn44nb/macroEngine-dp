# ============================================
# macro:cmd/other/multi_cmd/internal/step_func
# ============================================
# _mcmd_list iterates — each element is a function
# namespace:path string'idir.
# $function $(current_cmd) makrosu ile runs.
# ============================================

execute unless data storage macro:engine _mcmd_list[0] run return 0

data modify storage macro:engine _mcmd_entry set value {}
data modify storage macro:engine _mcmd_entry.current_cmd set from storage macro:engine _mcmd_list[0]
data remove storage macro:engine _mcmd_list[0]

function macro:cmd/other/multi_cmd/internal/exec_func with storage macro:engine _mcmd_entry

function macro:cmd/other/multi_cmd/internal/step_func
