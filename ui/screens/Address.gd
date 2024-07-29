extends Label

var monero_script = load("res://monero_wrapper.cs")
var monero = monero_script.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	%Address.text = monero.getAddress(0, 0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
