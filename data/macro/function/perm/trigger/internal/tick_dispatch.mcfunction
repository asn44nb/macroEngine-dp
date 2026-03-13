# ============================================
# macro:perm/trigger/internal/tick_dispatch
# ============================================
# perm_trigger_names in list, tick_step_loop is called for each trigger.
# O trigger'da active skoru with all players for player_dispatch runs.
#
# INPUT (makro): storage macro:engine _pt_tick_ctx = {name:"<trigger_adi>"}
# Call: as @a[scores={$(name)=1..}]
# ============================================

$execute as @a[scores={$(name)=1..}] run function macro:perm/trigger/internal/player_dispatch with storage macro:engine _pt_tick_ctx

# BUG FIX v2.0.1: Players who never triggered could not get enabled.
# player_dispatch sadece score>=1 for runs; ilk enable buradan gelir.
$execute as @a run scoreboard players enable @s $(name)
