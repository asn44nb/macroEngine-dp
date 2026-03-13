# ============================================
# macro:cooldown/detail
# ============================================
# cooldown/check + cooldown/remaining + expiry bilgisini
# Returns in a SINGLE call.
#
# INPUT: macro:input { player:"<n>", key:"<cooldown>" }
# OUTPUT: macro:output { active:1b/0b, remaining:<int>, expires:<int> }
#
# active — 1b: cooldown still ongoing / 0b: ended (ready)
# remaining — remaining tick count (0 = ready or no record)
# expires — expiry epoch tick value (0 = no record)
#
# EXAMPLES:
# # No cooldown / expired:
# → macro:output { active:0b, remaining:0, expires:0 }
#
# # Cooldown active (e.g. epoch=1300, expiry=1347):
# → macro:output { active:1b, remaining:47, expires:1347 }
#
# NOT: cooldown/check or cooldown/remaining instead of direct bu
# you can access all information in a single pass using the function.
# ============================================

# Defaults: ready, no record
data merge storage macro:output {active:0b,remaining:0,expires:0}

# If record missing, ready — early exit
$execute unless data storage macro:engine cooldowns.$(player).$(key) run return 0

# Expiry epoch'unu read ve output'a yaz
$execute store result score $cdd_exp macro.tmp run data get storage macro:engine cooldowns.$(player).$(key)
execute store result storage macro:output expires int 1 run scoreboard players get $cdd_exp macro.tmp

# Current epoch
execute store result score $cdd_now macro.tmp run scoreboard players get $epoch macro.time

# now < expiry → still active
execute if score $cdd_now macro.tmp < $cdd_exp macro.tmp run data modify storage macro:output active set value 1b

# remaining = expiry - now (sadece pozitifse yaz; 0 default gets)
scoreboard players operation $cdd_exp macro.tmp -= $cdd_now macro.tmp
execute if score $cdd_exp macro.tmp matches 1.. run execute store result storage macro:output remaining int 1 run scoreboard players get $cdd_exp macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/detail ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" active=","color":"#555555"},{"storage":"macro:output","nbt":"active","color":"green"},{"text":" rem=","color":"#555555"},{"storage":"macro:output","nbt":"remaining","color":"green"},{"text":" exp=","color":"#555555"},{"storage":"macro:output","nbt":"expires","color":"green"}]
