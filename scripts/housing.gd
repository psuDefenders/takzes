extends Node2D

var tier = 1
var dictNeededHousing = {"dumbster":500 , "cardboard_box":2500 , "tent":8800, "van":16000, "apartement":30000, "house":80000, "mansion":280000, "skyscraper":950000}
onready var game = get_tree().get_root().get_node("Control")

func _on_Goback_pressed():
	visible = false

func _on_upgrade_pressed():
	if tier == 1 && game.saving >= dictNeededHousing["dumbster"]:
		game.saving -= dictNeededHousing["dumbster"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("dumbster")
		$Message/NEXTTIER/tier.text = "Cardboard Box"
		$Message/howmuch/price.text = "2500"
		$Message/Capacityupgrade/upgrade.text = "20"
		#$Message/NextHousing.texture = 
	elif tier == 2 && game.saving >= dictNeededHousing["cardboard_box"]:
		game.saving -= dictNeededHousing["cardboard_box"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("cardboard box")
		$Message/NEXTTIER/tier.text = "Tent"
		$Message/howmuch/price.text = "8800"
		$Message/Capacityupgrade/upgrade.text = "20"
		#$Message/NextHousing.texture = 
	elif tier == 3 && game.saving >= dictNeededHousing["tent"]:
		game.saving -= dictNeededHousing["tent"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("tent")
		$Message/NEXTTIER/tier.text = "Van"
		$Message/howmuch/price.text = "16000"
		$Message/Capacityupgrade/upgrade.text = "30"
		#$Message/NextHousing.texture = 
	elif tier == 4 && game.saving >= dictNeededHousing["van"]:
		game.saving -= dictNeededHousing["van"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("van")
		$Message/NEXTTIER/tier.text = "Apartement"
		$Message/howmuch/price.text = "30000"
		$Message/Capacityupgrade/upgrade.text = "30"
		#$Message/NextHousing.texture = 
	elif tier == 5 && game.saving >= dictNeededHousing["apartement"]:
		game.saving -= dictNeededHousing["apartement"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("apartement")
		$Message/NEXTTIER/tier.text = "House"
		$Message/howmuch/price.text = "80000"
		$Message/Capacityupgrade/upgrade.text = "40"
		#$Message/NextHousing.texture =
	elif tier == 6 && game.saving >= dictNeededHousing["house"]:
		game.saving -= dictNeededHousing["house"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("house")
		$Message/NEXTTIER/tier.text = "Mansion"
		$Message/howmuch/price.text = "280000"
		$Message/Capacityupgrade/upgrade.text = "40"
		#$Message/NextHousing.texture =
	elif tier == 7 && game.saving >= dictNeededHousing["mansion"]:
		game.saving -= dictNeededHousing["mansion"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("mansion")
		$Message/NEXTTIER/tier.text = "Skyscraper"
		$Message/howmuch/price.text = "950000"
		$Message/Capacityupgrade/upgrade.text = "50"
		#$Message/NextHousing.texture =
	elif tier == 8 && game.saving >= dictNeededHousing["skyscraper"]:
		game.saving -= dictNeededHousing["skyscraper"]
		tier += 1
		get_tree().get_root().get_node("Control").upgrading("skyscraper")
		$Message/NEXTTIER/tier.text = "Maximum tier reached"
		$Message/howmuch/price.text = "Maximum tier reached"
		$Message/Capacityupgrade/upgrade.text = "Maximum tier reached"
		#$Message/NextHousing.texture =

