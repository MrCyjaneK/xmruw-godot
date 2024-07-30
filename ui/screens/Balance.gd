extends Label

var monero_script = load("res://monero_wrapper.cs")
var monero = monero_script.new()


func _ready():
	%Balance.text = "%.12f" % (monero.getBalance(0)/1e12) + " XMR"


func round_place(num, places):
	return (round(num*pow(10,places))/pow(10,places))
