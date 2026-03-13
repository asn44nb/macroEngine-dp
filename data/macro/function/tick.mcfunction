# ============================================
# macro:tick — Runs every tick (Flag-Controlled System)
# ============================================
# This file calls systems categorized by flags
# Flag Values (macro.Flags scoreboard):
# - #m_time: Time and counter systems (epoch, tick)
# - #m_queue: Queue processing systems
# - #m_player: Player trigger systems (menu, run, action)
# - #m_hud: Automatic HUD systems (progress bar)
# - #m_admin: Admin and debug systems
# 
# Flag = 1: System active
# Flag = 0: System disabled (disabled function runs)
# ============================================

execute unless entity @a run return 0

execute unless data storage macro:engine global{loaded:1b} run return 0

# ── Time Systems ──
execute if score #m_time macro.Flags matches 1 run function macro:tick/time_systems
execute if score #m_time macro.Flags matches 0 run function macro:tick/disabled

# ── Queue Systems ──
execute if score #m_queue macro.Flags matches 1 run function macro:tick/queue_systems
execute if score #m_queue macro.Flags matches 0 run function macro:tick/disabled

# ── Player Systems ──
execute if score #m_player macro.Flags matches 1 run function macro:tick/player_systems
execute if score #m_player macro.Flags matches 0 run function macro:tick/disabled

# ── HUD Systems ──
execute if score #m_hud macro.Flags matches 1 run function macro:tick/hud_systems
execute if score #m_hud macro.Flags matches 0 run function macro:tick/disabled

# ── Admin Systems ──
execute if score #m_admin macro.Flags matches 1 run function macro:tick/admin_systems
execute if score #m_admin macro.Flags matches 0 run function macro:tick/disabled
