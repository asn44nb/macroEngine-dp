# ============================================
# macro:interaction/internal/unbind_check
# ============================================
# Called with storage macro:engine _ia_ufilter.
# Compares _ia_ucur against filter (tag + func).
# If they do NOT match → reinsert into the bind list.
#
# INPUT (via with storage):
#   tag  : filter tag
#   func : filter func
#   list : "attack" or "use"
# ============================================

$execute unless data storage macro:engine _ia_ucur{tag:"$(tag)",func:"$(func)"} run data modify storage macro:engine interaction_binds.$(list) append from storage macro:engine _ia_ucur
