extends Control


func yes() -> void:
	if make_transaction() == 0:
		get_tree().change_scene_to_packed(load("res://ui/screens/home.tscn"))
	else:
		%Question.text = Monero.lastTxError()
		print(%Question.text)
		%Yes.hide()
		%No.text = "Ok"


func no() -> void:
	get_tree().change_scene_to_packed(load("res://ui/screens/home.tscn"))


## Returns 0 if the transaction was successful, returns the error code otherwise.
func make_transaction() -> int:
	var address = get_parent().find_child("Address").text
	var amountText = get_parent().find_child("Amount").text
	var amount = int(float(amountText)*1e12);
	Monero.createTransaction(address, amount)
	# This is a nice place to validate the data (e.g. address, balance, etc.)
	return Monero.lastTxErrorCode()
