# ============================================
# macro:perm/has
# ============================================
# Checks whether the player has permission.
# macro.admin tag every permission covers.
# Online player: pid-based entity tag (fast path)
# Offline player: storage fallback
#
# Pid-based targeting: @a[name=...] instead of macro.pid scoreboard
# used — safe for duplicate-name on offline-mode servers.
#
# INPUT:  macro:input  { player:"<n>", perm:"<permission_name>" }
# OUTPUT: macro:output { result: 1b (var) / 0b (yok) }
# ============================================

data modify storage macro:output result set value 0b

# ─── Resolve pid (reset + read; if path missing, gets 0) ──────────
scoreboard players set $ph_pid macro.tmp 0
$execute store result score $ph_pid macro.tmp run data get storage macro:engine player_pids.$(player)

# ─── Online checks (pid-based entity targeting) ───────────────
# admin tag every permission covers
execute as @a if score @s macro.pid = $ph_pid macro.tmp run execute if entity @s[tag=macro.admin] run data modify storage macro:output result set value 1b
# runtime perm tag (online player for fast path)
$execute as @a if score @s macro.pid = $ph_pid macro.tmp run execute if entity @s[tag=perm.$(perm)] run data modify storage macro:output result set value 1b

# ─── Storage fallback (if offline or tag not yet synced) ─
$execute if data storage macro:engine permissions.$(player).$(perm) run data modify storage macro:output result set value 1b

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/has ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(perm)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
