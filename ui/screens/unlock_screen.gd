extends Control


var password := ""


func _input(event: InputEvent) -> void:
	if (event is InputEventKey
			and event.is_pressed()):
		var text = OS.get_keycode_string(event.keycode)
		
		if text and text.is_valid_int():
			get_viewport().set_input_as_handled()
			password += text
			update()


func update() -> void:
	%Pin.text = "•".repeat(password.length())


func one() -> void:
	password += "1"
	update()


func two() -> void:
	password += "2"
	update()


func three() -> void:
	password += "3"
	update()


func four() -> void:
	password += "4"
	update()


func five() -> void:
	password += "5"
	update()


func six() -> void:
	password += "6"
	update()


func seven() -> void:
	password += "7"
	update()


func eight() -> void:
	password += "8"
	update()


func nine() -> void:
	password += "9"
	update()


func backspace() -> void:
	password = password.substr(0, password.length() - 1)
	update()


func zero() -> void:
	password += "0"
	update()

var monero_script = load("res://monero_wrapper.cs")
var monero = monero_script.new()

func unlock() -> void:
	print(OS.get_data_dir()+"/wallet")
	var checkPassword = monero.openWallet(OS.get_data_dir()+"/wallet", password)
	if checkPassword:
		monero.initWallet("http://node.xmr.rocks:18089", false, "") 
		get_tree().change_scene_to_packed(preload("res://ui/screens/home.tscn"))
	else:
		print(monero.lastError())
		# open failed - show error

func virtual_keyboard(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.virtual_keyboard_show(password, Rect2(), DisplayServer.KEYBOARD_TYPE_PASSWORD)
	else:
		DisplayServer.virtual_keyboard_hide()
