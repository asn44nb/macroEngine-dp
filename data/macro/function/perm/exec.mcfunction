# ============================================
# macro:perm/exec
# ============================================
# Checks permission and command specified player
# AS ve playernun AT runs.
# Sends error message to player if permission is missing.
#
# Differenceference from perm/run: storage-based permission check is also performed
# (offline player support).
#
# Pid-based targeting: @a[name=...] instead of macro.pid scoreboard
# used — safe for duplicate-name on offline-mode servers.
#
# INPUT: macro:input { player:"<n>", perm:"<permission>", cmd:"<command>" }
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input perm set value "builder"
# data modify storage macro:input cmd set value "give @s diamond 1"
# function macro:perm/exec with storage macro:input {}
# ============================================

# ─── Resolve pid (reset + read; if path missing, gets 0) ──────────
scoreboard players set $pex_pid macro.tmp 0
$execute store result score $pex_pid macro.tmp run data get storage macro:engine player_pids.$(player)
execute if score $pex_pid macro.tmp matches 0 run return 0

# ─── Permission check ─────────────────────────────────────────
# macro.admin tag bypasses all permission checks.
# For offline checks, fall bopenk to storage.
data modify storage macro:engine _pex_tmp set value {result:0b}
execute as @a if score @s macro.pid = $pex_pid macro.tmp run execute if entity @s[tag=macro.admin] run data modify storage macro:engine _pex_tmp.result set value 1b
$execute if data storage macro:engine permissions.$(player).$(perm) run data modify storage macro:engine _pex_tmp.result set value 1b

# ─── Permission denied ────────────────────────────────────────
$execute if data storage macro:engine _pex_tmp{result:0b} run execute as @a if score @s macro.pid = $pex_pid macro.tmp run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" — you don't have this permission.","color":"red"}]
execute if data storage macro:engine _pex_tmp{result:0b} run return 0

# ─── Execute ──────────────────────────────────────────────────
$execute as @a if score @s macro.pid = $pex_pid macro.tmp at @s run $(cmd)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/exec ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [","color":"#555555"},{"text":"$(perm)","color":"aqua"},{"text":"] → ","color":"#555555"},{"text":"$(cmd)","color":"green"}]
data remove storage macro:engine _pex_tmp
