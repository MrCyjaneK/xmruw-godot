extends Control

var monero_script = load("res://monero_wrapper.cs")
var monero = monero_script.new()

func _ready() -> void:
	%App.text = ProjectSettings.get_setting_with_override(&"application/config/name")
	
	# Load transactions example:
	for i in monero.getTransactionCount():
		var direction = monero.getTransactionDirection(i);
		var amount = "%.12f" % (monero.getTransactionAmount(i)/1e12) + " XMR";
		var timestamp = monero.getTransactionTimestamp(i)
		var transaction = Label.new()
		transaction.text = "d:" + str(direction) + " a: " + amount + " t: " + str(timestamp)
		%Transactions.add_child(transaction)



func code() -> void:
	# Do what you want when the code button is pressed.
	pass
