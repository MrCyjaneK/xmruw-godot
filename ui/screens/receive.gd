extends Control


func copy_address() -> void:
	DisplayServer.clipboard_set(Monero.getAddress(0, 0))
