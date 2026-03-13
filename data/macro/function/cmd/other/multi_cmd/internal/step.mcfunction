# ============================================
# macro:cmd/other/multi_cmd/internal/step
# ============================================
# _mcmd_list'i birer birer iterates.
# Her command string'i {current_cmd:"..."} compound'una
# is wrapped; then the $execute run $(current_cmd) macro
# runs.
#
# Call: function macro:cmd/other/multi_cmd/internal/step
# Prerequisite: macro:engine _mcmd_list must be filled
# ============================================

# Stop if list is empty
execute unless data storage macro:engine _mcmd_list[0] run return 0

# Wrap first element in compound (macro requires key)
data modify storage macro:engine _mcmd_entry set value {}
data modify storage macro:engine _mcmd_entry.current_cmd set from storage macro:engine _mcmd_list[0]
data remove storage macro:engine _mcmd_list[0]

# $execute run $(current_cmd) ile command run
function macro:cmd/other/multi_cmd/internal/exec with storage macro:engine _mcmd_entry

# One step after
function macro:cmd/other/multi_cmd/internal/step
