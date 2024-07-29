extends Label

var monero_script = load("res://monero_wrapper.cs")
var monero = monero_script.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	%Balance.text = "%.12f" % (monero.getBalance(0)/1e12) + " XMR"
	pass # Replace with function body.

func round_place(num, places):
	return (round(num*pow(10,places))/pow(10,places))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
