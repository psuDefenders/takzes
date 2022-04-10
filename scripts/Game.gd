extends Control

export var score = 0
export var money = 1
export var getmoney = 0
var combo = 0

var shop_delay = 0
var shop = false

var mail = false
var gotten_mail
var kind_of_mail
var mail_spam
var mail_count = 0

var day_count = 1

func _on_Timer_timeout():
	score += getmoney

func _on_MinTimer_timeout():
	gotten_mail = randi() % 19 #1/20 chance every minute
	if gotten_mail == 19 && mail_count < 11:
		kind_of_mail = randi() % 3 #0 = stock info, #1 = ads on shop(sales), #2 = news, #3 = spam
		if kind_of_mail == 0:
			print()
			mail_count += 1
		elif kind_of_mail == 1:
			print()
			mail_count += 1
		elif kind_of_mail == 2:
			print()
			mail_count += 1
		elif kind_of_mail == 3:
			mail_spam = randi() % 50
			mail_count += 1

func _on_DayTimer_timeout():
	day_count += 1
	$Date.text = str("Day ", day_count)

func _process(_delta):
	$Score.text = str(score)
	
	if shop_delay > 0:
		shop_delay -= 1

func _on_Click_pressed():
	$ClickTimer.start()
	if combo < 100:
		combo += 1
	if combo > 25:
		score += round(money * (combo / 25))
		$ComboEffect.emitting = true
	if combo <= 25:
		score += money

func _on_ClickTimer_timeout():
	combo = 0
	$ComboEffect.emitting = false # Effects

func _on_Shop_pressed():
	if shop == false and shop_delay ==0:
		shop = true
		shop_delay = 20
		$AnimationShop.play("shop")
		$AnimationShop.play("TheShop")
	elif shop == true and shop_delay ==0:
		shop = false
		shop_delay = 20
		$AnimationClose.play("shop")
		$AnimationClose.play("TheShop")

func _on_Mail_pressed():
	if mail == false:
		mail = true
		$TheMail.visible = true 
	elif mail == true:
		mail = false
		$TheMail.visible = false

