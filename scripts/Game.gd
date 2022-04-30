extends Control

export var score = 0
export var checking = 0
export var saving = 0
var combo = 0

var canClick = true

var gamerScore = 0

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
var time_till_next = 120
var time_activate = false


export var mpc = 1.0
export var mps = 0.0

var dictAmount = {"Stick":0 , "Plant":0 , "CD":0 , "64":0, "Wifi":0, "Gilberts":0,"Phone":0,"dumbells":0,"Keyboard":0,"fastFood":0,"edison":0,"car":0,"kimberly":0,"employee":0,"robot":0,"boombox":0,"airflower":0,"trapmusic":0,"classicalusic":0,"airFryer":0, "moneyLaunderer":0,"moneyPrinter":0}

var QoL = 1

func _ready():
	update_mp()
	$Message.message("Welcome", "Ciao, in this hypotetical reality. Your job is to push a boutton! Start by making 100$.", 0)
	on_tutorial = true

func update_mp():
	$MPS.text = str("MPS: ", mps)
	$MPC.text = str("MPC: ", mpc)

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
	time_till_next = 120
	day_count += 1
	saving = saving * 1.1
	$Shop/Date.text = str("Day ", day_count)

func day_over():
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
	$Score.text = str(score)
	$Checking.text = str(checking)
	$Savings.text = str(saving)
	
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
	if time_till_next < 60 and time_till_next > 10:
		$Shop/SkipDay.visible = true
	else:
		$Shop/SkipDay.visible = false

#func _on_Click_ready():
#	$Click.set_normal_texture(load("res://assets/Button.png"))
		
func _on_Click_button_up():
	pass
	
func _on_Click_pressed():
	$ClickTimer.start()
#	$Click.set_pressed_texture(load("res://assets/Button_Pressed.png"))
	if canClick:
		if combo < 100:
			combo += gamerScore
		if combo > 25:
			score += mpc * (combo / 25)
			$ComboEffect.emitting = true
		if combo <= 25:
			score += mpc

func _on_ClickTimer_timeout():
	combo = 0
	$ComboEffect.emitting = false

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
	mpc = mpc + (mpc * QoL)*0.1
	mps = mps + (mps * QoL)*0.1
	update_mp()

func _on_HOUSING_pressed():
	pass # Replace with function body.
