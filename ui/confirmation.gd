extends Control


func yes() -> void:
	if make_transaction() == 0:
		get_tree().change_scene_to_packed(load("res://ui/screens/home.tscn"))
	else:
		# Display error example
		#%Question.text = "Error X, please try again."
		%Yes.hide()
		%No.text = "Ok"


func no() -> void:
	get_tree().change_scene_to_packed(load("res://ui/screens/home.tscn"))


## Returns 0 if the transaction was successful, returns the error code otherwise.
func make_transaction() -> int:
	# This is a nice place to validate the data (e.g. address, balance, etc.)
	return 0
