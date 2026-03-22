# macro:string/function_suggest [compat_1_21_4 overlay]
# 1.21.4 ve öncesi: clickEvent/hoverEvent (eski format), suggest value alanı kullanır.

$tellraw $(target) [{"text":"$(title)","color":"$(color)","bold":true},{"text":"\n"},{"text":"$(body)","color":"gray","italic":true},{"text":"\n"},{"text":"/function macro:$(suggest)","color":"$(color)","underlined":true,"italic":false,"clickEvent":{"action":"suggest_command","value":"/function macro:$(suggest)"},"hoverEvent":{"action":"show_text","value":{"text":"Tikla ve duzenle","color":"gray","italic":true}}}]
