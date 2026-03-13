# ============================================
# macro:perm/trigger/internal/tick_start
# ============================================
# Each tick'te player_systems'dan is called.
# Gets perm_trigger_names list to temporary copy
# ve tick_step_loop ile iterates.
# ============================================

execute unless data storage macro:engine perm_trigger_names[0] run return 0

data modify storage macro:engine _pt_names_tmp set from storage macro:engine perm_trigger_names
function macro:perm/trigger/internal/tick_step_loop
data remove storage macro:engine _pt_names_tmp
