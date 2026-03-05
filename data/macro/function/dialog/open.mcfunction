# ============================================
# macro:dialog/open  [base — 1.21.1 fallback]
# ============================================
# 1.21.6+ overlay overrides this with the native
# dialog API. Below pack_format 80 we fall back
# to a chat-based prompt so the engine does not
# crash with a missing-function error.
#
# Requires: macro:engine dialog.DIALOG to be set
#           (same contract as the 1.21.6 version).
# ============================================

return run tellraw @s {"text":"This feature requires 1.21.6 or higher!","color":"red","italic":false}
