extends Node2D


var expensePercent = 0
var spendingPercent = 0
var savingPercent = 0

func _ready():
	$warning.visible = false
	$curLiveCost.text = "Current living expense: " + str(Global.livingExpense)
	$sldrExpenses.connect("value_changed", self, "expenses")
	$sldrSpending.connect("value_changed", self, "spending")


func budget():
	$curLiveCost.text = "Current living expense: " + str(Global.livingExpense)
	visible = true
	get_tree().get_root().get_node("Control").canClick = false
	get_parent().stopTimer()

func expenses(value):
	expensePercent = value
	$liveBudget.text = "Living Budget:         " + str(expensePercent) + "%"
	savings()
	if Global.livingExpense > (value*0.01) * get_parent().score:
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
	else:
		$warning.visible = false
		visible = false
		get_parent().get_node("SkipDay").visible = true
		get_parent().on_tutorial = false
		get_parent().shopAccessible = true
		transfer_money()

func transfer_money():
	get_parent().checking += round(get_parent().score * (spendingPercent*0.01))
	get_parent().saving += round(get_parent().score * (savingPercent*0.01))
	Global.extraliving = round((get_parent().score * (expensePercent*0.01)) - Global.livingExpense)
	print(Global.extraliving)
	get_parent().canClick = true
	get_parent().score = 0
	get_parent().startTimer()

func _on_Transfer_pressed():
	get_parent().checking = get_parent().checking + get_parent().saving
	get_parent().saving = 0
