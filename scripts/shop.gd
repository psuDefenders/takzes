extends Control

onready var score# = get_tree().get_root().get_node("Control").score
onready var money# = get_tree().get_root().get_node("Control").money
onready var getmoney# = get_tree().get_root().get_node("Control").getmoney

onready var MPS = get_node("../scene/Game/MPS")
onready var MPC = get_node("../scene/Game/MPC")
var MPCRequirement = 20
var MPSRequirement = 20

func _process(_delta):
	score = get_tree().get_root().get_node("Control").score
	money = get_tree().get_root().get_node("Control").money
	getmoney = get_tree().get_root().get_node("Control").getmoney

func _on_MPC1_pressed():
	if score >= MPCRequirement:
		score -= MPCRequirement
		MPCRequirement = round(MPCRequirement * 1.4)
		#money = money + 1
		$ShopList/MPC1.text = str("+1 MPC [", MPCRequirement, "]") #Combine multiple strings to show the required clicks.
		MPC.text = str("MPC:", money)

func _on_MPS1_pressed():
	if score >= MPSRequirement:
		score -= MPSRequirement
		MPSRequirement = round(MPSRequirement * 1.4)
		getmoney = getmoney + 1
		$ShopList/MPS1.text = str("+1 MPS [", MPSRequirement, "]") #Combine multiple strings to show the required clicks.
		MPS.text = str("MPS:", to_string(getmoney)getmoney)
		
