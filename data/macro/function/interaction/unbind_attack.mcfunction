# ============================================
# macro:interaction/unbind_attack
# ============================================
# Removes a specific attack bind (tag + func pair).
# Only the exact tag+func combination is removed;
# other binds for the same tag remain intact.
#
# INPUT: macro:input
#   tag  : <string> — Entity tag of the bind to remove
#   func : <string> — Function of the bind to remove
#
# EXAMPLE:
#   data modify storage macro:input tag  set value "shop_button"
#   data modify storage macro:input func set value "mypack:shop/on_attack"
#   function macro:interaction/unbind_attack with storage macro:input {}
# ============================================

execute unless data storage macro:engine interaction_binds.attack[0] run return 0

# Copy list, clear original, reinsert non-matching entries
data modify storage macro:engine _ia_ubinds set from storage macro:engine interaction_binds.attack
data modify storage macro:engine interaction_binds.attack set value []
$data modify storage macro:engine _ia_ufilter set value {tag:"$(tag)", func:"$(func)", list:"attack"}
function macro:interaction/internal/unbind_filter
data remove storage macro:engine _ia_ubinds
data remove storage macro:engine _ia_ufilter

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"interaction/unbind_attack ","color":"aqua"},{"text":"✘ ","color":"red"},{"text":"$(tag)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]
