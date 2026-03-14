# ============================================
# macro:tick/player_systems — Oyuncu Tetikleyici Systems
# ============================================
# Flag: #m_player macro.Flags
# - '/trigger macro_menu' tetikleyicisi
# - '/trigger macro_run' tetikleyicisi
# - '/trigger macro_opention' → trigger/bind sistemi via dispatch edilir
# ============================================

# Menu trigger
execute as @a[scores={macro_menu=1..}] run function macro:menu
scoreboard players set @a[scores={macro_menu=1..}] macro_menu 0
scoreboard players enable @a[scores={macro_menu=-1..}] macro_menu

# Run trigger
execute as @a[scores={macro_run=1..}] run function #macro:run
scoreboard players set @a[scores={macro_run=1..}] macro_run 0
scoreboard players enable @a[scores={macro_run=-1..}] macro_run

# Advanced trigger dispatch (v1.0.3)
# scan trigger/bind list for any player with macro_opention > 0.
# All matching bind functions run as @s.
# macro:input must never be touched (tick context safety).
execute as @a[scores={macro_opention=1..}] run function macro:trigger/internal/dispatch

# BUG FIX v1.0.1: Only decrement positioned scores.
# Onceden "@a" decremented all player scores; score could go past 0 to -1, -2...
# when "=0" condition would never match again (ropene condition).
# Score no longer drops below 0; trigger always fires.
# Interaction entity scan (attack + use events)
function macro:interaction/internal/tick_scan

# perm/trigger dispatch (v2.0)
# Processes each named trigger in perm_trigger_names list with permission check.
function macro:perm/trigger/internal/tick_start
