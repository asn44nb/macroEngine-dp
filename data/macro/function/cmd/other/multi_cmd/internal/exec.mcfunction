# ============================================
# macro:cmd/other/multi_cmd/internal/exec
# ============================================
# Tek bir komutu çalıştıran makro çekirdeği.
# INPUT (makro): { current_cmd:"<komut>" }
#
# $execute run $(current_cmd) paterni ile
# mevcut executor ve konumda komutu tetikler.
# ============================================

$execute run $(current_cmd)
