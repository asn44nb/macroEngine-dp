# ============================================
# macro:string/broadcast_raw
# ============================================
# Sends a full JSON text component to all players.
# For messages containing complex colour/hover/click components.
# announce instead of bunu kullanin.
#
# INPUT: macro:input { json:"<tellraw JSON string>" }
#
# EXAMPLE:
# data modify storage macro:input json set value "[{\"text\":\"Hello \",\"color\":\"white\"},{\"text\":\"World\",\"color\":\"gold\",\"bold\":true}]"
# function macro:string/broadcast_raw with storage macro:input {}
# ============================================

$tellraw @a $(json)
