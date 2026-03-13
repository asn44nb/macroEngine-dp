# ============================================
# macro:math/minmax
# ============================================
# Returns the minimum AND maximum of two values in a single pass.
# Combined version of macro:math/min + macro:math/max call
# — both are calculated in a single scoreboard pass.
#
# INPUT: macro:input { a:<int>, b:<int> }
# OUTPUT: macro:output { min:<int>, max:<int> }
#
# EXAMPLES:
# minmax(15, 7) → { min:7, max:15 }
# minmax(-3, 5) → { min:-3, max:5 }
# minmax( 4, 4) → { min:4, max:4 }
# ============================================

$scoreboard players set $mmx_a macro.tmp $(a)
$scoreboard players set $mmx_b macro.tmp $(b)

# lo = a; if b < a then lo = b
scoreboard players operation $mmx_lo macro.tmp = $mmx_a macro.tmp
execute if score $mmx_b macro.tmp < $mmx_a macro.tmp run scoreboard players operation $mmx_lo macro.tmp = $mmx_b macro.tmp

# hi = a; if b > a then hi = b
scoreboard players operation $mmx_hi macro.tmp = $mmx_a macro.tmp
execute if score $mmx_b macro.tmp > $mmx_a macro.tmp run scoreboard players operation $mmx_hi macro.tmp = $mmx_b macro.tmp

execute store result storage macro:output min int 1 run scoreboard players get $mmx_lo macro.tmp
execute store result storage macro:output max int 1 run scoreboard players get $mmx_hi macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/minmax ","color":"aqua"},{"text":"($(a),$(b))","color":"gray"},{"text":" → ","color":"#555555"},{"text":"min=","color":"gray"},{"storage":"macro:output","nbt":"min","color":"green"},{"text":" max=","color":"gray"},{"storage":"macro:output","nbt":"max","color":"green"}]
