extends Control

var score
var money
var getmoney

var MPSRequirement = 20
var MPCRequirement = 20

func _process(_delta):
	score = get_node("res://scripts/Game.gd").score
	money = get_node("res://scripts/Game.gd").money
	getmoney = get_node("res://scripts/Game.gd").getmoney

func _on_MPC1_pressed():
	if score >= MPCRequirement:
		score -= MPCRequirement
		MPCRequirement = round(MPCRequirement * 1.4)
		money = money + 1
		$ShopList/MPC1.text = str("+1 MPC [", MPCRequirement, "]") #Combine multiple strings to show the required clicks.
		$MPC.text = str("MPC:", money)
		
func _on_MPS1_pressed():
	if score >= MPSRequirement:
		score -= MPSRequirement
		MPSRequirement = round(MPSRequirement * 1.4)
		getmoney = getmoney + 1
		$ShopList/MPS1.text = str("+1 MPS [", MPSRequirement, "]") #Combine multiple strings to show the required clicks.
		$MPS.text = str("MPS:", getmoney)
		
