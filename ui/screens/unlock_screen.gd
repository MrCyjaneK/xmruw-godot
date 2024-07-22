extends Control


const PIN_LENGTH := 4

var password := ""


func _input(event: InputEvent) -> void:
	if (event is InputEventKey
			and event.is_pressed()):
		var text = OS.get_keycode_string(event.keycode)
		
		if text and password.length() < PIN_LENGTH and text.is_valid_int():
			get_viewport().set_input_as_handled()
			password += text
			update()


func update() -> void:
	%Pin.text = "•".repeat(password.length())


func one() -> void:
	if password.length() < PIN_LENGTH:
		password += "1"
		update()


func two() -> void:
	if password.length() < PIN_LENGTH:
		password += "2"
		update()


func three() -> void:
	if password.length() < PIN_LENGTH:
		password += "3"
		update()


func four() -> void:
	if password.length() < PIN_LENGTH:
		password += "4"
		update()


func five() -> void:
	if password.length() < PIN_LENGTH:
		password += "5"
		update()


func six() -> void:
	if password.length() < PIN_LENGTH:
		password += "6"
		update()


func seven() -> void:
	if password.length() < PIN_LENGTH:
		password += "7"
		update()


func eight() -> void:
	if password.length() < PIN_LENGTH:
		password += "8"
		update()


func nine() -> void:
	if password.length() < PIN_LENGTH:
		password += "9"
		update()


func backspace() -> void:
	password = password.substr(0, password.length() - 1)
	update()


func zero() -> void:
	if password.length() < PIN_LENGTH:
		password += "0"
		update()


func unlock() -> void:
	# Logic to validate the password here
	#if password != get_actual_password():
		#return
	
	get_tree().change_scene_to_packed(preload("res://ui/screens/home.tscn"))


func virtual_keyboard(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.virtual_keyboard_show(password, Rect2(), DisplayServer.KEYBOARD_TYPE_PASSWORD, PIN_LENGTH)
	else:
		DisplayServer.virtual_keyboard_hide()
