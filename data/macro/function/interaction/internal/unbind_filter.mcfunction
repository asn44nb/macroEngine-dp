# ============================================
# macro:interaction/internal/unbind_filter
# ============================================
# Iterates _ia_ubinds; re-inserts entries into
# interaction_binds.$(list) unless they exactly
# match the (tag, func) pair in _ia_ufilter.
#
# _ia_ufilter format: { tag:"...", func:"...", list:"attack"|"use" }
#
# Called from: interaction/unbind_attack, interaction/unbind_use
# ============================================

execute unless data storage macro:engine _ia_ubinds[0] run return 0

data modify storage macro:engine _ia_ucur set from storage macro:engine _ia_ubinds[0]
data remove storage macro:engine _ia_ubinds[0]

# Reinsert unless this entry exactly matches the filter (tag + func)
function macro:interaction/internal/unbind_check with storage macro:engine _ia_ufilter

function macro:interaction/internal/unbind_filter
data remove storage macro:engine _ia_ucur
