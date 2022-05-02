extends Node

var lore = 0
var firstTime = true 

var livingExpense = 40
var extraliving = 0


const capacity_dumpter = 5
const capacity_cardboard = 5
const capacity_tent = 10
const capacity_van = 10
const capacity_apartement = 15
const capacity_house = 30
const capacity_mansion = 50
const capacity_skyscraper = 205

var dictMPC = {"Stick":0.1 , "Plant":3 , "CD":0 , "64":-1, "Wifi":0,"Phone":8,"dumbells":2.5,"Keyboard":0.5,"fastFood":-1,"edison":0}
var dictMPS = {"Stick":0, "Plant":0 , "CD":3 , "64":0, "Wifi":7,"Phone":-5,"dumbells":0,"Keyboard":1.5,"fastFood":-1,"edison":55}

var moneyStick = [0.1,0]
var moneyPlant = [3,0]
var moneyCD = [0,3]
var money64 = [-1,0]
var moneyWifi = [0,7]
var moneyPhone = [8,-5]
var moneyKeyboard = [0.5,1.5]
var moneyFastFood = [-1,-1]
var moneyEdison = [0,55]
var moneyDumbells = [2.5,0]


