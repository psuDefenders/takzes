extends Control

onready var score# = get_tree().get_root().get_node("Control").score
onready var money# = get_tree().get_root().get_node("Control").money
onready var getmoney# = get_tree().get_root().get_node("Control").getmoney
onready var checking
onready var saving

onready var MPS = get_tree().get_root().get_node("Control/MPS")
onready var MPC = get_tree().get_root().get_node("Control/MPC")
var MPC1Needed = 20
var MPS1Needed = 20
var MoneyPrinterNeeded = 50
var StickNeeded = 10
var PlantNeeded = 30
var CdplayerNeeded = 150

var SELLINGMODE = false

func _process(_delta):
	score = get_tree().get_root().get_node("Control").score
	money = get_tree().get_root().get_node("Control").money
	getmoney = get_tree().get_root().get_node("Control").getmoney
	checking = get_tree().get_root().get_node("Control").checking
	saving = get_tree().get_root().get_node("Control").saving
#	if checking >= MPC1Needed:
#		$ScrollContainer/ShopList/MPC1.set("custom_colors/font_color",Color(0,255,0))
#	else:
#		$ScrollContainer/ShopList/MPC1.set("custom_colors/font_color",Color(255,0,0))
#	if checking >= MPS1Needed:
#		$ScrollContainer/ShopList/MPS1.set("custom_colors/font_color",Color(0,255,0))
#	else:
#		$ScrollContainer/ShopList/MPS1.set("custom_colors/font_color",Color(255,0,0))
#	if checking >= MoneyPrinterNeeded:
#		$ScrollContainer/ShopList/MoneyPrinter/Name.set("custom_colors/font_color",Color(0,255,0))
#	else:
#		$ScrollContainer/ShopList/MoneyPrinter/Name.set("custom_colors/font_color",Color(255,0,0))

func _on_sellmode_pressed():
	if SELLINGMODE == false:
		SELLINGMODE = true
		$ScrollContainer/ShopList/info/sell/ModeOn.text = "Sell Mode : On"
	elif SELLINGMODE == true:
		SELLINGMODE = false
		$ScrollContainer/ShopList/info/sell/ModeOn.text = "Sell Mode : Off"

func _on_MPC1_pressed():
	if score >= MPC1Needed:
		get_tree().get_root().get_node("Control").score -= MPC1Needed
		MPC1Needed = round(MPC1Needed * 1.4)
		get_tree().get_root().get_node("Control").money = get_tree().get_root().get_node("Control").money + 1
		$ScrollContainer/ShopList/MPC1.text = str("+1 MPC [", MPC1Needed, "]")
		MPC.text = str("MPC: ", money +1)

func _on_MPS1_pressed():
	if score >= MPS1Needed:
		get_tree().get_root().get_node("Control").score -= MPS1Needed
		MPS1Needed = round(MPS1Needed * 1.4)
		get_tree().get_root().get_node("Control").getmoney = get_tree().get_root().get_node("Control").getmoney + 1
		$ScrollContainer/ShopList/MPS1.text = str("+1 MPS [", MPS1Needed, "]")
		MPS.text = str("MPS: ", getmoney +1)

func _on_BuyMoneyPrinter_pressed():
	if SELLINGMODE == false and checking >= MoneyPrinterNeeded:
		get_tree().get_root().get_node("Control").checking -= MoneyPrinterNeeded
		MoneyPrinterNeeded = round(MoneyPrinterNeeded * 1.4)
		get_tree().get_root().get_node("Control").getmoney = get_tree().get_root().get_node("Control").getmoney + 50
		$ScrollContainer/ShopList/MoneyPrinter/Price.text = str(MoneyPrinterNeeded , "$")
		get_tree().get_root().get_node("Control").moneyPrinter += 1
		$ScrollContainer/ShopList/MoneyPrinter/amount.text = str("x", get_tree().get_root().get_node("Control").moneyPrinter)
		MPS.text = str("MPS: ", getmoney +50)
		Global.livingExpense += 30
	elif SELLINGMODE == true  and get_tree().get_root().get_node("Control").moneyPrinter != 0:
		get_tree().get_root().get_node("Control").checking += round(MoneyPrinterNeeded*0.1)
		MoneyPrinterNeeded = round(MoneyPrinterNeeded / 1.4)
		get_tree().get_root().get_node("Control").getmoney = get_tree().get_root().get_node("Control").getmoney - 50
		$ScrollContainer/ShopList/MoneyPrinter/Price.text = str(MoneyPrinterNeeded , "$")
		get_tree().get_root().get_node("Control").moneyPrinter -= 1
		$ScrollContainer/ShopList/MoneyPrinter/amount.text = str("x", get_tree().get_root().get_node("Control").moneyPrinter)
		MPS.text = str("MPS: ", getmoney -50)
		Global.livingExpense -= 30

func _on_BuyStick_pressed():
	if SELLINGMODE == false and checking >= StickNeeded:
		get_tree().get_root().get_node("Control").checking -= StickNeeded
		StickNeeded = round(StickNeeded * 1.4)
		get_tree().get_root().get_node("Control").money = get_tree().get_root().get_node("Control").money + 1
		$ScrollContainer/ShopList/Stick/Price.text = str(StickNeeded , "$")
		get_tree().get_root().get_node("Control").stick += 1
		$ScrollContainer/ShopList/Stick/amount.text = str("x", get_tree().get_root().get_node("Control").stick)
		MPC.text = str("MPC: ", money +1)
		Global.livingExpense += 0
	elif SELLINGMODE == true  and get_tree().get_root().get_node("Control").stick != 0:
		get_tree().get_root().get_node("Control").checking += round(StickNeeded*0.1)
		StickNeeded = round(StickNeeded / 1.4)
		get_tree().get_root().get_node("Control").money = get_tree().get_root().get_node("Control").money - 1
		$ScrollContainer/ShopList/Stick/Price.text = str(StickNeeded , "$")
		get_tree().get_root().get_node("Control").stick -= 1
		$ScrollContainer/ShopList/Stick/amount.text = str("x", get_tree().get_root().get_node("Control").stick)
		MPC.text = str("MPC: ", money -1)
		Global.livingExpense -= 0


func _on_BuyPlant_pressed():
	if SELLINGMODE == false and checking >= PlantNeeded:
		get_tree().get_root().get_node("Control").checking -= PlantNeeded
		PlantNeeded = round(PlantNeeded * 1.4)
		get_tree().get_root().get_node("Control").getmoney = get_tree().get_root().get_node("Control").getmoney + 2
		$ScrollContainer/ShopList/Plant/Price.text = str(PlantNeeded , "$")
		get_tree().get_root().get_node("Control").plant += 1
		$ScrollContainer/ShopList/Plant/amount.text = str("x", get_tree().get_root().get_node("Control").plant)
		MPS.text = str("MPS: ", getmoney +2)
		Global.livingExpense += 0
	elif SELLINGMODE == true and get_tree().get_root().get_node("Control").plant != 0:
		get_tree().get_root().get_node("Control").checking += round(PlantNeeded*0.1)
		PlantNeeded = round(PlantNeeded / 1.4)
		get_tree().get_root().get_node("Control").getmoney = get_tree().get_root().get_node("Control").getmoney - 2
		$ScrollContainer/ShopList/Plant/Price.text = str(PlantNeeded , "$")
		get_tree().get_root().get_node("Control").plant -= 1
		$ScrollContainer/ShopList/Plant/amount.text = str("x", get_tree().get_root().get_node("Control").plant)
		MPS.text = str("MPS: ", getmoney -2)
		Global.livingExpense -= 0

func _on_BuyCD_pressed():
	if SELLINGMODE == false and checking >= CdplayerNeeded:
		get_tree().get_root().get_node("Control").checking -= CdplayerNeeded
		CdplayerNeeded = round(CdplayerNeeded * 1.4)
		get_tree().get_root().get_node("Control").money = get_tree().get_root().get_node("Control").money + 4
		$ScrollContainer/ShopList/CD_Player/Price.text = str(CdplayerNeeded , "$")
		get_tree().get_root().get_node("Control").cdPlayer += 1
		$ScrollContainer/ShopList/CD_Player/amount.text = str("x", get_tree().get_root().get_node("Control").cdPlayer)
		MPC.text = str("MPC: ", money +4)
		Global.livingExpense += 20
	elif SELLINGMODE == true and get_tree().get_root().get_node("Control").cdPlayer != 0:
		get_tree().get_root().get_node("Control").checking += round(CdplayerNeeded*0.1)
		CdplayerNeeded = round(CdplayerNeeded / 1.4)
		get_tree().get_root().get_node("Control").money = get_tree().get_root().get_node("Control").money - 4
		$ScrollContainer/ShopList/CD_Player/Price.text = str(CdplayerNeeded , "$")
		get_tree().get_root().get_node("Control").cdPlayer -= 1
		$ScrollContainer/ShopList/CD_Player/amount.text = str("x", get_tree().get_root().get_node("Control").cdPlayer)
		MPC.text = str("MPC: ", money -4)
		Global.livingExpense -= 20
