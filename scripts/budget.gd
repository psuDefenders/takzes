extends Node2D


var expensePercent = 0
var spendingPercent = 0
var savingPercent = 0

func _ready():
	$warning.visible = false
	$curLiveCost.text = "Current living expense: " + str(get_parent().round_to_dec(Global.livingExpense, 2))
	$sldrExpenses.connect("value_changed", self, "expenses")
	$sldrSpending.connect("value_changed", self, "spending")


func budget():
	$curLiveCost.text = "Current living expense: " + str(get_parent().round_to_dec(Global.livingExpense, 2))
	$tax.text = "Tax: " + str(get_parent().round_to_dec(get_parent().lastTax, 2))
	visible = true
	get_tree().get_root().get_node("Control").canClick = false

func expenses(value):
	expensePercent = value
	$liveBudget.text = "Living Budget:         " + str(expensePercent) + "%"
	savings()
	if !enough():#Global.livingExpense > (value*0.01) * get_parent().score:
		$warning.visible = true
		$warning.text = "You dont have enough money to live"

func spending(value):
	spendingPercent = value
	$spendBudget.text = "Spending Budget:         " + str(spendingPercent) + "%"
	savings()

func savings():
	savingPercent = 100 - spendingPercent - expensePercent
	$Savings.text = "Savings: " + str(savingPercent) + "%"
	if savingPercent < 0:
		$warning.visible = true
		$warning.text = "Your savings can't be in the negatives"
	else:
		$warning.visible = false


func _on_btn_finish_pressed():
	if savingPercent < 0:
		$warning.visible = true
		$warning.text = "Your savings can't be in the negatives"
	elif !enough():
		$warning.visible = true
		$warning.text = "You dont have enough money to live"
	else:
		$warning.visible = false
		visible = false
		if get_parent().on_tutorial == true:
			get_parent().tutorial_end()
		get_parent().shopAccessible = true
		get_parent().time_till_next = 120
		transfer_money()

func transfer_money():
	get_parent().checking += round(get_parent().score * (spendingPercent*0.01))
	get_parent().saving += round(get_parent().score * (savingPercent*0.01))
	Global.extraliving = round((get_parent().score * (expensePercent*0.01)) - Global.livingExpense)
	print(Global.extraliving)
	get_parent().canClick = true
	get_parent().score = 0
	get_parent().time_activate = true
	QoL()
	get_parent().new_day()

func _on_Transfer_pressed():
	get_parent().checking = get_parent().checking + get_parent().saving
	get_parent().saving = 0

func enough():
	var enough = false
	if Global.livingExpense > (expensePercent*0.01) * get_parent().score:
		enough = false
	else:
		enough = true
	return enough

func QoL():
	if expensePercent > 0 and expensePercent < 51:
		get_parent().QoL = (expensePercent * 1.15)/50
	elif expensePercent > 50 and expensePercent < 101:
		get_parent().QoL = 1.15
		get_parent().QoL += ((expensePercent-50)*0.05)/50
	get_parent().QoL()
