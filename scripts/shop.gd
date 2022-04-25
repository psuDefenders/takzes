extends Control

onready var score# = get_tree().get_root().get_node("Control").score
onready var money# = get_tree().get_root().get_node("Control").money
onready var getmoney# = get_tree().get_root().get_node("Control").getmoney
onready var checking
onready var saving

onready var game = get_tree().get_root().get_node("Control")
onready var MPS = get_tree().get_root().get_node("Control/MPS")
onready var MPC = get_tree().get_root().get_node("Control/MPC")
var MPC1Needed = 20
var MPS1Needed = 20
var MoneyPrinterNeeded = 50

var dictNeeded = {"Stick":10 , "Plant":30 , "CD":150}
var StickNeeded = 10
var PlantNeeded = 30
var CdplayerNeeded = 150

var SELLINGMODE = false

#func _process(_delta):
#	score = get_tree().get_root().get_node("Control").score
#	money = get_tree().get_root().get_node("Control").money
#	getmoney = get_tree().get_root().get_node("Control").getmoney
#	checking = get_tree().get_root().get_node("Control").checking
#	saving = get_tree().get_root().get_node("Control").saving
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

#func _on_BuyMoneyPrinter_pressed():
#	if SELLINGMODE == false and checking >= MoneyPrinterNeeded:
#		get_tree().get_root().get_node("Control").checking -= MoneyPrinterNeeded
#		MoneyPrinterNeeded = round(MoneyPrinterNeeded * 1.4)
#		get_tree().get_root().get_node("Control").getmoney = get_tree().get_root().get_node("Control").getmoney + 50
#		$ScrollContainer/ShopList/MoneyPrinter/Price.text = str(MoneyPrinterNeeded , "$")
#		get_tree().get_root().get_node("Control").moneyPrinter += 1
#		$ScrollContainer/ShopList/MoneyPrinter/amount.text = str("x", get_tree().get_root().get_node("Control").moneyPrinter)
#		MPS.text = str("MPS: ", getmoney +50)
#		Global.livingExpense += 30
#	elif SELLINGMODE == true  and get_tree().get_root().get_node("Control").moneyPrinter != 0:
#		get_tree().get_root().get_node("Control").checking += round(MoneyPrinterNeeded*0.1)
#		MoneyPrinterNeeded = round(MoneyPrinterNeeded / 1.4)
#		get_tree().get_root().get_node("Control").getmoney = get_tree().get_root().get_node("Control").getmoney - 50
#		$ScrollContainer/ShopList/MoneyPrinter/Price.text = str(MoneyPrinterNeeded , "$")
#		get_tree().get_root().get_node("Control").moneyPrinter -= 1
#		$ScrollContainer/ShopList/MoneyPrinter/amount.text = str("x", get_tree().get_root().get_node("Control").moneyPrinter)
#		MPS.text = str("MPS: ", getmoney -50)
#		Global.livingExpense -= 30


func buy_sell(item_needed, mpc, mps, liveCost, itemCount):
	if SELLINGMODE == false and game.checking >= dictNeeded[item_needed]:
		game.checking -= dictNeeded[item_needed]
		dictNeeded[item_needed] = round(dictNeeded[item_needed] * 1.4)
		game.mpc = game.mpc + mpc
		game.mps = game.mps + mps
		$ScrollContainer/ShopList/Stick/Price.text = str(dictNeeded[item_needed] , "$")
		Global.livingExpense += liveCost
	elif SELLINGMODE == true  and itemCount != 0:
		game.checking += round(dictNeeded[item_needed]*0.1)
		dictNeeded[item_needed]= round(dictNeeded[item_needed] / 1.4)
		game.mpc = game.mpc - mpc
		game.mps = game.mps - mps
		game.stick -= 1
		$ScrollContainer/ShopList/Stick/Price.text = str(dictNeeded[item_needed] , "$")
		Global.livingExpense -= liveCost
	game.update_mp()
	update_amounts()

func update_amounts():
	$ScrollContainer/ShopList/Stick/amount.text = str("x", game.stick)

#func _on_BuyStick_pressed():
#	if SELLINGMODE == false and game.checking >= dictNeeded["Stick"]:
#		game.checking -= dictNeeded["Stick"]
#		dictNeeded["Stick"] = round(dictNeeded["Stick"] * 1.4)
#		game.mpc = game.mpc + 1                 								#MPC GAINS GO HERE
#		game.stick += 1
#		$ScrollContainer/ShopList/Stick/Price.text = str(dictNeeded["Stick"] , "$")
#		$ScrollContainer/ShopList/Stick/amount.text = str("x", game.stick)
#		Global.livingExpense += 0             									#LIVING EXPENSE COST GO HERE
#	elif SELLINGMODE == true  and game.stick != 0:
#		game.checking += round(StickNeeded*0.1)
#		StickNeeded = round(StickNeeded / 1.4)
#		game.mpc = game.mpc - 1                 								#MPC GAINS GO HERE
#		game.stick -= 1
#		$ScrollContainer/ShopList/Stick/Price.text = str(StickNeeded , "$")
#		$ScrollContainer/ShopList/Stick/amount.text = str("x", game.stick)
#		Global.livingExpense -= 0           									#LIVING EXPENSE COST GO HERE
#	game.update_mp()

func _on_BuyStick_pressed():
	buy_sell("Stick",1,0,0,game.stick)   #Item name in dictionary, mpc gains, mps gains, living cost, item in question
	game.stick += 1

func _on_BuyPlant_pressed():
	buy_sell("Plant",5,0,0,game.stick)   #Item name in dictionary, mpc gains, mps gains, living cost, item in question
	game.plant += 1

func _on_BuyCD_pressed():
	buy_sell("CD",0,10,20,game.stick)   #Item name in dictionary, mpc gains, mps gains, living cost, item in question
	game.cdPlayer += 1
	
	
