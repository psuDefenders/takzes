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
var dictNeeded = {"Stick":1 , "Plant":30 , "CD":150, "64":240, "Wifi":500, "Gilberts":0,"Phone":1000,"dumbells":70,"Keyboard":250,"fastFood":13.50,"edison":500,"car":0,"kimberly":0,"employee":0,"robot":0,"boombox":0,"airflower":0,"trapmusic":0,"classicalusic":0,"airFryer":0, "moneyLaunderer":0,"moneyPrinter":0}
var StickNeeded = 10
var PlantNeeded = 30
var CdplayerNeeded = 150

var Capacity = 0
var SELLINGMODE = false

func _physics_process(delta):
	check_availlable("Stick")
	check_availlable("Plant")
	check_availlable("CD")
	check_availlable("64")
	check_availlable("Wifi")
	check_availlable("Phone")
	check_availlable("Keyboard")
	check_availlable("fastFood")
	check_availlable("edison")
	check_availlable("dumbells")
	$ScrollContainer/ShopList/info/living.text = "Living Expenses: " + str(game.round_to_dec(Global.livingExpense, 2))


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
		$ScrollContainer/ShopList/info/sell.texture = load("res://assets/selling.png")
		$ScrollContainer/ShopList/info/sell/ModeOn.text = "Sell Mode : On"
	elif SELLINGMODE == true:
		SELLINGMODE = false
		$ScrollContainer/ShopList/info/sell.texture= load("res://assets/sell.png")
		$ScrollContainer/ShopList/info/sell/ModeOn.text = "Sell Mode : Off"

func check_availlable(item_needed):
	if SELLINGMODE == false and game.checking >= dictNeeded[item_needed] and game.Capacity < game.maxCapacity:
		get_node("ScrollContainer/ShopList/"+ item_needed+"/Name").modulate= Color(1,1,1)
	elif SELLINGMODE == true  and game.dictAmount[item_needed] != 0:
		get_node("ScrollContainer/ShopList/"+ item_needed+"/Name").modulate= Color(1,1,1)
	else:
		get_node("ScrollContainer/ShopList/"+ item_needed+"/Name").modulate= Color(1,0,0)

func buy_sell(item_needed, mpc, mps, liveCost):
	if SELLINGMODE == false and game.checking >= dictNeeded[item_needed] and game.Capacity < game.maxCapacity:
		game.checking -= dictNeeded[item_needed]
		dictNeeded[item_needed] = round(dictNeeded[item_needed] * 1.4)
		game.mpc = game.mpc + mpc
		game.mps = game.mps + mps
		game.dictAmount[item_needed] += 1
		get_node("ScrollContainer/ShopList/"+ item_needed+"/amount").text = str("x", game.dictAmount[item_needed])
		get_node("ScrollContainer/ShopList/"+ item_needed+"/Price").text = str(dictNeeded[item_needed] , "$")
		game.Capacity += 1
		Global.livingExpense += liveCost
		$ScrollContainer/ShopList/info/capacity.text = "Capacity: " +str(game.Capacity)+ "/"+ str(game.maxCapacity)
		game.QoL()
	elif SELLINGMODE == true  and game.dictAmount[item_needed] != 0:
		game.checking += round(dictNeeded[item_needed]*0.1)
		dictNeeded[item_needed]= round(dictNeeded[item_needed] / 1.4)
		game.mpc = game.mpc - mpc
		game.mps = game.mps - mps
		game.dictAmount[item_needed] -= 1
		get_node("ScrollContainer/ShopList/"+ item_needed+"/amount").text = str("x", game.dictAmount[item_needed])
		get_node("ScrollContainer/ShopList/"+ item_needed+"/Price").text = str(dictNeeded[item_needed] , "$")
		Global.livingExpense -= liveCost
		game.Capacity -= 1
		$ScrollContainer/ShopList/info/capacity.text = "Capacity: " +str(game.Capacity)+ "/"+str(game.maxCapacity)
		game.QoL()
	game.update_mp()

func _on_BuyStick_pressed():
	buy_sell("Stick",0.2,0,0)		#Item name in dictionary, mpc gains, mps gains, living cost, item in question

func _on_BuyPlant_pressed():
	buy_sell("Plant",3,0,0)			#Item name in dictionary, mpc gains, mps gains, living cost, item in question

func _on_BuyCD_pressed():			#Item name in dictionary, mpc gains, mps gains, living cost, item in question
	buy_sell("CD",0,4.5,30)

func _on_Buy64_pressed():			#Item name in dictionary, mpc gains, mps gains, living cost, item in question
	buy_sell("64",-1,0,1)

func _on_buyInternet_pressed():		#Item name in dictionary, mpc gains, mps gains, living cost, item in question
	buy_sell("Wifi",0,9,50)

func _on_buyPhone_pressed():		#Item name in dictionary, mpc gains, mps gains, living cost, item in question
	buy_sell("Phone",8,-5,2)

func _on_buyKeyboard_pressed():		#Item name in dictionary, mpc gains, mps gains, living cost, item in question
	buy_sell("Keyboard",0.5,1.5,5)

func _on_buyBurger_pressed():		#Item name in dictionary, mpc gains, mps gains, living cost, item in question
	buy_sell("fastFood",-1,-1,0)

func _on_buyTesla_pressed():		#Item name in dictionary, mpc gains, mps gains, living cost, item in question
	buy_sell("edison",0,55,225)

func _on_buyTraining_pressed():
	buy_sell("dumbells",2.5,0,0.5)
