extends Button


@export_file("*.tscn") var scene := ""


func _ready() -> void:
	assert(ResourceLoader.exists(scene), "scene from path %s doesn't exist" % scene)
	
	if not button_pressed:
		text = ""


func _pressed() -> void:
	if get_tree().current_scene.scene_file_path != scene:
		Events.wallet_screen_changed.emit(load(scene))
	else:
		button_pressed = true
