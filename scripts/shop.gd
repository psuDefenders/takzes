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

onready var dictElements = {"Stick":$ScrollContainer/ShopList/Stick/amount , "Plant":30 , "CD":150, "64":0, "Wifi":0, "Gilberts":0,"Phone":0,"dumbells":0,"Keyboard":0,"fastFood":0,"edison":0,"car":0,"kimberly":0,"employee":0,"robot":0,"boombox":0,"airflower":0,"trapmusic":0,"classicalusic":0,"airFryer":0, "moneyLaunderer":0,"moneyPrinter":0}
var dictNeeded = {"Stick":10 , "Plant":30 , "CD":150, "64":0, "Wifi":0, "Gilberts":0,"Phone":0,"dumbells":0,"Keyboard":0,"fastFood":0,"edison":0,"car":0,"kimberly":0,"employee":0,"robot":0,"boombox":0,"airflower":0,"trapmusic":0,"classicalusic":0,"airFryer":0, "moneyLaunderer":0,"moneyPrinter":0}
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

func buy_sell(item_needed, mpc, mps, liveCost, itemCount):
	if SELLINGMODE == false and game.checking >= dictNeeded[item_needed]:
		game.checking -= dictNeeded[item_needed]
		dictNeeded[item_needed] = round(dictNeeded[item_needed] * 1.4)
		game.mpc = game.mpc + mpc
		game.mps = game.mps + mps
		game.dictAmount[item_needed] += 1
		get_node("ScrollContainer/ShopList/"+ item_needed+"/amount").text = str("x", game.dictAmount[item_needed])
		get_node("ScrollContainer/ShopList/"+ item_needed+"/Price").text = str(dictNeeded[item_needed] , "$")
		Global.livingExpense += liveCost
	elif SELLINGMODE == true  and itemCount != 0:
		game.checking += round(dictNeeded[item_needed]*0.1)
		dictNeeded[item_needed]= round(dictNeeded[item_needed] / 1.4)
		game.mpc = game.mpc - mpc
		game.mps = game.mps - mps
		game.dictAmount[item_needed] -= 1
		get_node("ScrollContainer/ShopList/"+ item_needed+"/amount").text = str("x", game.dictAmount[item_needed])
		get_node("ScrollContainer/ShopList/"+ item_needed+"/Price").text = str(dictNeeded[item_needed] , "$")
		Global.livingExpense -= liveCost
	game.update_mp()



func _on_BuyStick_pressed():
	buy_sell("Stick",1,0,0,game.stick)   #Item name in dictionary, mpc gains, mps gains, living cost, item in question

func _on_BuyPlant_pressed():
	buy_sell("Plant",5,0,0,game.stick)   #Item name in dictionary, mpc gains, mps gains, living cost, item in question

func _on_BuyCD_pressed():
	buy_sell("CD",0,10,20,game.stick)   #Item name in dictionary, mpc gains, mps gains, living cost, item in question

	
	
