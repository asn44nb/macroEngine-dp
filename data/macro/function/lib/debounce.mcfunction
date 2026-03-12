# ============================================
# macro:lib/debounce
# ============================================
# Schedules the function only if not already scheduled.
# If a schedule is already active, ignores the call
# (first call is preserved — subsequent ones are dropped).
#
# For the opposite behaviour (keep the LAST call, cancel earlier ones):
# call schedule_cancel then schedule.
#
# INPUT: macro:input { func:"<namespace:path>", interval:<tick>, key:"<id>" }
# EXAMPLE:
# data modify storage macro:input func set value "mypack:save/checkpoint"
# data modify storage macro:input interval set value 60
# data modify storage macro:input key set value "autosave"
# function macro:lib/debounce with storage macro:input {}
# # → Player triggers every second but the save only runs once per 3s window
# ============================================

# Schedule already active → ignore call (debounce: keep the first, drop the rest)
$execute if data storage macro:engine schedules.$(key) run return 0

# Key absent → create a new normal schedule
function macro:lib/schedule with storage macro:input {}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/debounce ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]
