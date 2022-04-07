extends Control

onready var score# = get_tree().get_root().get_node("Control").score
onready var money# = get_tree().get_root().get_node("Control").money
onready var getmoney# = get_tree().get_root().get_node("Control").getmoney

onready var MPS = get_tree().get_root().get_node("Control/MPS")
onready var MPC = get_tree().get_root().get_node("Control/MPC")
var MPC1Needed = 20
var MPS1Needed = 20

func _process(_delta):
	score = get_tree().get_root().get_node("Control").score
	money = get_tree().get_root().get_node("Control").money
	getmoney = get_tree().get_root().get_node("Control").getmoney

func _on_MPC1_pressed():
	if score >= MPC1Needed:
		get_tree().get_root().get_node("Control").score -= MPC1Needed
		MPC1Needed = round(MPC1Needed * 1.4)
		get_tree().get_root().get_node("Control").money = get_tree().get_root().get_node("Control").money + 1
		$ShopList/MPC1.text = str("+1 MPC [", MPC1Needed, "]")
		MPC.text = str("MPC: ", money +1)

func _on_MPS1_pressed():
	if score >= MPS1Needed:
		get_tree().get_root().get_node("Control").score -= MPS1Needed
		MPS1Needed = round(MPS1Needed * 1.4)
		get_tree().get_root().get_node("Control").getmoney = get_tree().get_root().get_node("Control").getmoney + 1
		$ShopList/MPS1.text = str("+1 MPS [", MPS1Needed, "]")
		MPS.text = str("MPS: ", getmoney +1)
		
