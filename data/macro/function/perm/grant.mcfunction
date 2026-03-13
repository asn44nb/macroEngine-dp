# ============================================
# macro:perm/grant
# ============================================
# Playerya permission grants.
# Storage persistent record (including offline), entity tag runtime fast access.
# tag format: perm.<perm_name> (saved to Java playerdata — persistent)
#
# Pid-based targeting: @a[name=...] instead of macro.pid scoreboard
# used — safe for duplicate-name on offline-mode servers.
#
# INPUT: macro:input { player:"<n>", perm:"<permission_name>" }
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input perm set value "builder"
# function macro:perm/grant with storage macro:input {}
# ============================================

# ─── Executor admin check ──────────────────────────────────────
# SECURITY NOTE: This guard only fires when called as a player entity (@s).
# Command blocks, functions called via /function, and direct storage writes
# bypass this check by design — they are considered trusted server-side callers.
# Do NOT call perm/grant from untrusted player-driven contexts without an
# explicit upstream @s[tag=macro.admin] guard in the calling function.
execute if entity @s unless entity @s[tag=macro.admin] run return run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

# ─── Write to storage (persists offline) ──────────────────────
$data modify storage macro:engine permissions.$(player).$(perm) set value 1b

# ─── Apply runtime tag (pid-based) ────────────────────────────
scoreboard players set $pg_pid macro.tmp 0
$execute store result score $pg_pid macro.tmp run data get storage macro:engine player_pids.$(player)
$execute as @a if score @s macro.pid = $pg_pid macro.tmp run tag @s add perm.$(perm)

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/grant ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(player)","color":"white"},{"text":" ← ","color":"#555555"},{"text":"$(perm)","color":"aqua"}]
