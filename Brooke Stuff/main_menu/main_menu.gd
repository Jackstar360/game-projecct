extends Control

class_name MainMenu

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit as Button
# @onready var upgrades_menu = 
# add jack's menu scene

func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	
func on_start_pressed() -> void:
	pass
	
func on_exit_pressed() -> void:
	get_tree().quit()
	


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
