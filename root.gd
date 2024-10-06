extends Control


enum WalletTheme {
	XMRUW,
	CAKE,
	STACK,
}

const WALLET := {
	WalletTheme.XMRUW: preload("res://xmruw/screens/unlock_screen.tscn"),
	WalletTheme.CAKE: preload("res://cake/screens/unlock_screen.tscn"),
	WalletTheme.STACK: preload("res://stack/screens/unlock_screen.tscn"),
}

## The wallet theme to be used.
@export var wallet_theme := WalletTheme.XMRUW

## The current wallet screen.
var screen: Node


func _ready() -> void:
	Events.wallet_screen_changed.connect(change_screen)
	
	# Load main scene based on wallet theme
	change_screen(WALLET[wallet_theme])


func change_screen(scene: PackedScene) -> void:
	if is_instance_valid(screen):
		screen.queue_free()
	
	screen = scene.instantiate()
	add_child(screen)
