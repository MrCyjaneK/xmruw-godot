extends Control


func _ready() -> void:
	%App.text = ProjectSettings.get_setting_with_override(&"application/config/name")
	
	# Load transactions example:
	#for text in get_transactions():
		#var transaction = Label.new()
		#transaction.text = text
		#%Transactions.add_child(transaction)


func code() -> void:
	# Do what you want when the code button is pressed.
	pass
