extends Node2D

var tier = 1
var dictNeededHousing = {"dumbster":44 , "cardboard_box":100, "tent":200, "van":3520, "apartement":20000, "house":800000, "mansion":2800000, "skyscraper":18000000}
onready var game = get_tree().get_root().get_node("Control")

func _physics_process(delta):
	$house.frame = tier - 2
	$house2.frame = tier - 1
	if tier == 1 or tier > 8:
		$house.visible = false
		if tier > 8:
			$Message/UPGRADE.visible = false
	else:
		$house.visible = true

func _on_Goback_pressed():
	visible = false

func _on_upgrade_pressed():
	if tier == 1 && game.saving >= dictNeededHousing["dumbster"]:
		game.saving -= dictNeededHousing["dumbster"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("dumbster")
		$Message/NEXTTIER/tier.text = "Cardboard Box"
		$Message/howmuch/price.text = "100"
		$Message/Capacityupgrade/upgrade.text = str(Global.capacity_cardboard)
		#$Message/NextHousing.texture = 
	elif tier == 2 && game.saving >= dictNeededHousing["cardboard_box"]:
		game.saving -= dictNeededHousing["cardboard_box"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("cardboard box")
		$Message/NEXTTIER/tier.text = "Tent"
		$Message/howmuch/price.text = "200"
		$Message/Capacityupgrade/upgrade.text = str(Global.capacity_tent)
		#$Message/NextHousing.texture = 
	elif tier == 3 && game.saving >= dictNeededHousing["tent"]:
		game.saving -= dictNeededHousing["tent"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("tent")
		$Message/NEXTTIER/tier.text = "Van"
		$Message/howmuch/price.text = "3520"
		$Message/Capacityupgrade/upgrade.text = str(Global.capacity_van)
		#$Message/NextHousing.texture = 
	elif tier == 4 && game.saving >= dictNeededHousing["van"]:
		game.saving -= dictNeededHousing["van"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("van")
		$Message/NEXTTIER/tier.text = "Apartement"
		$Message/howmuch/price.text = "20000"
		$Message/Capacityupgrade/upgrade.text = str(Global.capacity_apartement)
		#$Message/NextHousing.texture = 
	elif tier == 5 && game.saving >= dictNeededHousing["apartement"]:
		game.saving -= dictNeededHousing["apartement"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("apartement")
		$Message/NEXTTIER/tier.text = "House"
		$Message/howmuch/price.text = "800000"
		$Message/Capacityupgrade/upgrade.text = str(Global.capacity_house)
		#$Message/NextHousing.texture =
	elif tier == 6 && game.saving >= dictNeededHousing["house"]:
		game.saving -= dictNeededHousing["house"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("house")
		$Message/NEXTTIER/tier.text = "Mansion"
		$Message/howmuch/price.text = "2800000"
		$Message/Capacityupgrade/upgrade.text = str(Global.capacity_mansion)
		#$Message/NextHousing.texture =
	elif tier == 7 && game.saving >= dictNeededHousing["mansion"]:
		game.saving -= dictNeededHousing["mansion"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("mansion")
		$Message/NEXTTIER/tier.text = "Skyscraper"
		$Message/howmuch/price.text = "18000000"
		$Message/Capacityupgrade/upgrade.text = str(Global.capacity_skyscraper)
		#$Message/NextHousing.texture =
	elif tier == 8 && game.saving >= dictNeededHousing["skyscraper"]:
		game.saving -= dictNeededHousing["skyscraper"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("skyscraper")
		$Message/NEXTTIER/tier.text = "Maximum tier reached"
		$Message/howmuch/price.text = "Maximum tier reached"
		$Message/Capacityupgrade/upgrade.text = "Maximum tier reached"
		#$Message/NextHousing.texture =

