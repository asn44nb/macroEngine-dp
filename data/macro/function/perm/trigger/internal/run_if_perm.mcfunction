# ============================================
# macro:perm/trigger/internal/run_if_perm
# ============================================
# @s (player) for permission tag check performs.
# macro.admin tag or perm.<perm> tag → exec runs.
# If neither exists, sends permission denied message to player.
#
# INPUT (makro): storage macro:engine _ptd_current
# = {value:<int>, func:"..." or cmd:"...", perm:"<permission>"}
# Call: AS @s (the player)
# ============================================

# admin bypass
execute if entity @s[tag=macro.admin] run function macro:perm/trigger/internal/exec with storage macro:engine _ptd_current

# perm tag check (admin if not)
$execute unless entity @s[tag=macro.admin] if entity @s[tag=perm.$(perm)] run function macro:perm/trigger/internal/exec with storage macro:engine _ptd_current

# Each ikisi de if missing → permission denied
$execute unless entity @s[tag=macro.admin] unless entity @s[tag=perm.$(perm)] run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" — you don't have this permission.","color":"red"}]
