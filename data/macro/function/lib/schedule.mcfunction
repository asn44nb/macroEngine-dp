# ============================================
# macro:lib/schedule
# ============================================
# Schedules a function to run once after a given interval of ticks.
# To cancel: call macro:lib/schedule_cancel with the same key.
# To renew: call macro:lib/schedule_renew inside the function.
#
# BUG FIX v3.2: Re-calling with the same key will now RESET the timer.
# The old behavior (update func/interval without resetting timer) was
# confusing. Now calling schedule with an existing key cancels the
# old schedule and starts a new one with the full interval.
#
# INPUT: macro:input { func:"<namespace:path>", interval:<tick>, key:"<schedule_id>" }
# EXAMPLE:
# data modify storage macro:input func set value "mypack:tasks/heartbeat"
# data modify storage macro:input interval set value 200
# data modify storage macro:input key set value "heartbeat"
# function macro:lib/schedule with storage macro:input {}
# ============================================

# If key exists, remove it from queue and storage (will be re-added below)
$execute if data storage macro:engine schedules.$(key) run data remove storage macro:engine schedules.$(key)

# Add new schedule entry and enqueue
$data modify storage macro:engine schedules.$(key).func set value "$(func)"
$data modify storage macro:engine schedules.$(key).interval set value $(interval)
$data modify storage macro:engine queue append value {func:"$(func)", delay:$(interval)}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/schedule ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]
