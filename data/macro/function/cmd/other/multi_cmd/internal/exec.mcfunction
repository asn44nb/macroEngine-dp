# ============================================
# macro:cmd/other/multi_cmd/internal/exec
# ============================================
# Macro core that runs a single command.
# INPUT (makro): { current_cmd:"<command>" }
#
# $execute run $(current_cmd) paterni ile
# current executor ve konumda command tetikler.
# ============================================

$execute run $(current_cmd)
