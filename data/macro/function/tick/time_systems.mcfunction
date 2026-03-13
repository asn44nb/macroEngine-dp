# ============================================
# macro:tick/time_systems — Zaman ve Sayopen Systems
# ============================================
# Flag: #m_time macro.Flags
# - $epoch macro.time: absolute tick counter (for cooldown)
# - $tick macro.tmp: ticks elapsed since last sync_tick (1s reset interval)
# ============================================

scoreboard players add $epoch macro.time 1
scoreboard players add $tick macro.tmp 1

# BUG FIX v3.0: Reset recursion counter every tick
scoreboard players set $pq_depth macro.tmp 0
