# ============================================
# macro:perm/revoke
# ============================================
# From player permission gets. Clears both storage and tag.
#
# Pid-based targeting: @a[name=...] instead of macro.pid scoreboard
# used — safe for duplicate-name on offline-mode servers.
#
# INPUT: macro:input { player:"<n>", perm:"<permission_name>" }
# ============================================

execute unless entity @s[tag=macro.admin] run return run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

# ─── Remove from storage (offline-safe) ───────────────────────
$data remove storage macro:engine permissions.$(player).$(perm)

# ─── Remove runtime tag (pid-based) ───────────────────────────
scoreboard players set $prv_pid macro.tmp 0
$execute store result score $prv_pid macro.tmp run data get storage macro:engine player_pids.$(player)
$execute as @a if score @s macro.pid = $prv_pid macro.tmp run tag @s remove perm.$(perm)

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/revoke ","color":"aqua"},{"text":"✘ ","color":"red"},{"text":"$(player)","color":"white"},{"text":" — ","color":"#555555"},{"text":"$(perm)","color":"aqua"},{"text":" revoked","color":"#555555"}]
