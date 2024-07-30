extends Control


func _ready() -> void:
	%App.text = ProjectSettings.get_setting_with_override(&"application/config/name")
	
	# Load transactions example:
	for i in Monero.getTransactionCount():
		var direction = Monero.getTransactionDirection(i);
		var amount = "%.12f" % (Monero.getTransactionAmount(i)/1e12) + " XMR";
		var timestamp = Monero.getTransactionTimestamp(i)
		var transaction = Label.new()
		transaction.text = "d:" + str(direction) + " a: " + amount + " t: " + str(timestamp)
		%Transactions.add_child(transaction)


func code() -> void:
	# Do what you want when the code button is pressed.
	pass
