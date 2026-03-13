# ============================================
# macro:perm/trigger/internal/unbind_reinsert
# ============================================
# is called by unbind_filter.
# Adds non-matching bind back to perm_triggers.$(name).
#
# INPUT (makro): storage macro:engine _pt_filter_ctx = {name:"<trigger_adi>"}
# ============================================

$data modify storage macro:engine perm_triggers.$(name) append from storage macro:engine _pt_unbind[0]
