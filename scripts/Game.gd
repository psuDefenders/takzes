extends Control

export var score = 0
export var checking = 0
export var saving = 0
var combo = 0

var muted = false

var canClick = true

var gamerScore = 0

var level = 1
var shop_delay = 0
var shopAccessible = false
var shop = false
var on_tutorial = true

var mail = false
var gotten_mail
var kind_of_mail
var mail_spam
var mail_count = 0

var maxCapacity = 10

var day_count = 0
var time_till_next = 60
var time_activate = false

var Capacity = 0
var lastTax = 0

export var mpc = 1.0
export var mps = 0.0

var dictAmount = {"Stick":0 , "Plant":0 , "CD":0 , "64":0, "Wifi":0, "Gilberts":0,"Phone":0,"dumbells":0,"Keyboard":0,"fastFood":0,"edison":0,"car":0,"kimberly":0,"employee":0,"robot":0,"boombox":0,"airflower":0,"trapmusic":0,"classicalusic":0,"airFryer":0, "moneyLaunderer":0,"moneyPrinter":0}

var QoL = 1

func _ready():
	update_mp()
	$Message.message("Welcome", "Ciao, in this hypotetical reality. Your job is to push a boutton! Start by making 100$.", 0)
	on_tutorial = true

func update_mp():
	mpc = 1 + get_mpc("Stick") + get_mpc("Plant") + get_mpc("CD") + get_mpc("64") + get_mpc("Wifi") + get_mpc("Phone") + get_mpc("dumbells") + get_mpc("Keyboard") + get_mpc("fastFood") + get_mpc("edison")
	mps = 1 + get_mps("Stick") + get_mps("Plant") + get_mps("CD") + get_mps("64") + get_mps("Wifi") + get_mps("Phone") + get_mps("dumbells") + get_mps("Keyboard") + get_mps("fastFood") + get_mps("edison")
	
	$MPS.text = str("MPS: ", round_to_dec(mps,2))
	$MPC.text = str("MPC: ", round_to_dec(mpc,2))

func _on_Timer_timeout():
	if canClick == true:
		score += mps


func _on_MinTimer_timeout():
	gotten_mail = randi() % 19 #1/20 chance every minute
	if gotten_mail == 19 && mail_count < 11:
		kind_of_mail = randi() % 3 #0 = stock info, #1 = ads on shop(sales), #2 = news, #3 = spam
		if kind_of_mail == 0:
			print("stock info")
			mail_count += 1
		elif kind_of_mail == 1:
			print("ads")
			mail_count += 1
		elif kind_of_mail == 2:
			print("news")
			mail_count += 1
		elif kind_of_mail == 3:
			print("spam")
			mail_spam = randi() % 50
			mail_count += 1


func new_day():
	time_till_next = 60
	day_count += 1
	saving = saving * 1.1
	$Shop/Date.text = str("Day ", day_count)
	Global.livingExpense = Global.livingExpense * 1.15

func day_over():
	#Taxes
	Global.livingExpense -= lastTax
	Global.livingExpense += score * 0.15
	lastTax = score * 0.15
	
	if Global.livingExpense > score:
		if Global.livingExpense < score + saving:
			saving -= (Global.livingExpense - score)
			score = 0
			new_day()
		else:
			$Failure.failure()
	else:
		$budget.budget()
	time_activate = false

func _process(_delta):
	$QoL.text = str("QoL: "+str(QoL))
	$Score.text = str(round_to_dec(score,2))
	$Checking.text = str(round_to_dec(checking,2))
	$Savings.text = str(round_to_dec(saving,2))
	
	$Shop.visible = shopAccessible
	$Shop/timetillday.text = str("Time till next day: " + str(round(time_till_next)))
	
	if score >= 100 and Global.lore == 0:
		$Message.message("Congrats", "Congratulation on making a hundred! You worked hard on this and it would be a shame to spend it badly. It's time to budget!", 1)
		canClick = false
		Global.lore = 1
	
	if shop_delay > 0:
		shop_delay -= 1
	
	if time_activate == true and time_till_next > 0:
		time_till_next -= 1*_delta
	if time_till_next <= 0:
		time_activate = false
		day_over()
	if time_till_next < 30 and time_till_next > 10:
		$Shop/SkipDay.visible = true
	else:
		$Shop/SkipDay.visible = false

func _on_Click_ready():
	$Click.set_normal_texture(load("res://assets/button.png"))
		
func _on_Click_button_up():
	pass
	
func _on_Click_pressed():
	$ClickTimer.start()
	$Click.set_pressed_texture(load("res://assets/Button_Pressed.png"))
	if canClick:
		if combo < 100:
			combo += dictAmount["64"]
		if combo > 25:
			score += mpc * (combo / 25)
			#$ComboEffect.emitting = true
		if combo <= 25:
			score += mpc

func _on_ClickTimer_timeout():
	combo = 0

func _on_Shop_pressed():
	if shop == false and shop_delay ==0:
		shop = true
		shop_delay = 20
		$AnimationShop.play("shop")
	elif shop == true and shop_delay ==0:
		shop = false
		shop_delay = 20
		$AnimationClose.play("shop")

#func _on_Mail_pressed():
#	if mail == false:
#		mail = true
#		$TheMail.visible = true 
#	elif mail == true:
#		mail = false
#		$TheMail.visible = false

func tutorial_end():
	on_tutorial = false
	$Shop/Date.visible = true
	#$Shop/SkipDay.visible = true
	$Shop/timetillday.visible = true

func _on_SkipDay_pressed():
	if on_tutorial == false:
		day_over()

func QoL():
	pass
#	mpc = mpc + (mpc * QoL)*0.1
#	mps = mps + (mps * QoL)*0.1
#	update_mp()

func _on_HOUSING_pressed():
	$housing.visible = true

func upgrading(tiername):
	level += 1
	if level == 2:
		Global.livingExpense += 1
		maxCapacity += Global.capacity_dumpter
		$Shop/TheShop/ScrollContainer/ShopList/info/capacity.text = "Capacity: " +str(Capacity)+ "/"+ str(maxCapacity)
		$Shop/TheShop/ScrollContainer/ShopList/info/HOME.text = "Home: "+tiername
	elif level == 3:
		Global.livingExpense += 1
		maxCapacity += Global.capacity_cardboard
		$Shop/TheShop/ScrollContainer/ShopList/info/capacity.text = "Capacity: " +str(Capacity)+ "/"+ str(maxCapacity)
		$Shop/TheShop/ScrollContainer/ShopList/info/HOME.text = "Home: "+tiername
	elif level == 4:
		Global.livingExpense += 50
		maxCapacity += Global.capacity_tent
		$Shop/TheShop/ScrollContainer/ShopList/info/capacity.text = "Capacity: " +str(Capacity)+ "/"+ str(maxCapacity)
		$Shop/TheShop/ScrollContainer/ShopList/info/HOME.text = "Home: "+tiername
	elif level == 5:
		Global.livingExpense += 1000
		maxCapacity += Global.capacity_van
		$Shop/TheShop/ScrollContainer/ShopList/info/capacity.text = "Capacity: " +str(Capacity)+ "/"+ str(maxCapacity)
		$Shop/TheShop/ScrollContainer/ShopList/info/HOME.text = "Home: "+tiername
	elif level == 6:
		Global.livingExpense += 5000
		maxCapacity += Global.capacity_apartement
		$Shop/TheShop/ScrollContainer/ShopList/info/capacity.text = "Capacity: " +str(Capacity)+ "/"+ str(maxCapacity)
		$Shop/TheShop/ScrollContainer/ShopList/info/HOME.text = "Home: "+tiername
	elif level == 7:
		Global.livingExpense += 15000
		maxCapacity += Global.capacity_house
		$Shop/TheShop/ScrollContainer/ShopList/info/capacity.text = "Capacity: " +str(Capacity)+ "/"+ str(maxCapacity)
		$Shop/TheShop/ScrollContainer/ShopList/info/HOME.text = "Home: "+tiername
	elif level == 8:
		Global.livingExpense += 20000
		maxCapacity += Global.capacity_mansion
		$Shop/TheShop/ScrollContainer/ShopList/info/capacity.text = "Capacity: " +str(Capacity)+ "/"+ str(maxCapacity)
		$Shop/TheShop/ScrollContainer/ShopList/info/HOME.text = "Home: "+tiername
	elif level == 9:
		Global.livingExpense += 100000
		maxCapacity += Global.capacity_skyscraper
		$Shop/TheShop/ScrollContainer/ShopList/info/capacity.text = "Capacity: " +str(Capacity)+ "/"+ str(maxCapacity)
		$Shop/TheShop/ScrollContainer/ShopList/info/HOME.text= "Home: "+tiername

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)


func _on_mute_pressed():
	if !muted:
		muted = true
		$mute.icon = load("res://assets/volume_off.png")
		$AudioStreamPlayer.volume_db = -80
	else:
		muted = false
		$mute.icon = load("res://assets/volume_on.png")
		$AudioStreamPlayer.volume_db = -8
func get_mps(item_needed):
	var mps
	mps = dictAmount[item_needed] * Global.dictMPS[item_needed]
	return mps
func get_mpc(item_needed):
	var mpc
	mpc = dictAmount[item_needed] * Global.dictMPC[item_needed]
	return mpc
