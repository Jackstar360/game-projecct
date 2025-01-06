extends Control

# Variable to hold the player's money
var player_money : int = 100  # Set an initial value or get from player stats

# Price dictionary (for each button/item)
var prices = {
	"Farmer": 50,
	"Feral Cat": 30
}

# References to UI nodes
@onready var money_label = $VBoxContainer/Panel2/Label
@onready var button_farmer = $VBoxContainer/MarginContainer/ScrollContainer/HBoxContainer/ButtonFarmer
@onready var button_feral = $VBoxContainer/MarginContainer/ScrollContainer/HBoxContainer/ButtonFeral

# Original names for each button to revert back after hover
const original_texts = {
	"Farmer": "Farmer",
	"Feral Cat": "Feral Cat"
}

# Method to update the money display
func update_money_display():
	money_label.text = "Money: " + str(player_money)

# Initialization
func _ready():
	# Set the initial money display
	update_money_display()

	# Set initial text for buttons
	button_farmer.text = original_texts["Farmer"]
	button_feral.text = original_texts["Feral Cat"]

	# Connect hover signals for the buttons
	button_farmer.connect("mouse_entered", Callable(self, "_on_button_farmer_hovered"))
	button_farmer.connect("mouse_exited", Callable(self, "_on_button_hover_exited"))

	button_feral.connect("mouse_entered", Callable(self, "_on_button_feral_hovered"))
	button_feral.connect("mouse_exited", Callable(self, "_on_button_hover_exited"))

# Signal handlers for Button Farmer
func _on_button_farmer_hovered():
	# Change the text of the Farmer button to show the price
	button_farmer.text = "Cost: " + str(prices["Farmer"])

func _on_button_feral_hovered():
	# Change the text of the Feral Cat button to show the price
	button_feral.text = "Cost: " + str(prices["Feral Cat"])

# Reset text on hover exit for both buttons
func _on_button_hover_exited():
	# Revert button text to original names
	button_farmer.text = original_texts["Farmer"]
	button_feral.text = original_texts["Feral Cat"]
