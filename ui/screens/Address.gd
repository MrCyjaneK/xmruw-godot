extends Label

var monero_script = load("res://monero_wrapper.cs")
var monero = monero_script.new()


func _ready():
	%Address.text = monero.getAddress(0, 0)

