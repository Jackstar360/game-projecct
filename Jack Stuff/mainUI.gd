extends Control

# Define the unit data with name, icon, and cost for each unit
var unit_data = [
	{"icon": load("res://PNG/FC Upgrade 1.png"), "name": "Farmer", "cost": 50},
	{"icon": load("res://PNG/FC Upgrade 2.png"), "name": "Mage", "cost": 70},
	{"icon": load("res://PNG/FC Upgrade 3.png"), "name": "Cannon", "cost": 100}
]

# Function to create a button with unit details
func create_unit_button(unit_icon: Texture, unit_name: String, unit_cost: int) -> Button:
	# Create a Button to act as the unit display
	var button = Button.new()
	button.size_flags_horizontal = Control.SIZE_EXPAND | Control.SIZE_FILL

	# Create a StyleBoxFlat for rounded button style
	var style_box = StyleBoxFlat.new()
	style_box.bg_color = Color(1, 1, 1, 1)
	style_box.corner_radius_top_left = 8
	style_box.corner_radius_top_right = 8
	style_box.corner_radius_bottom_left = 8
	style_box.corner_radius_bottom_right = 8
	button.add_theme_stylebox_override("normal", style_box)


	# Create a CenterContainer for centering content
	var center_container = CenterContainer.new()
	center_container.size_flags_horizontal = Control.SIZE_EXPAND | Control.SIZE_FILL
	center_container.size_flags_vertical = Control.SIZE_EXPAND | Control.SIZE_FILL
	button.add_child(center_container)  # Add CenterContainer to button

	# VBoxContainer to organize image, name, and cost vertically
	var vbox = VBoxContainer.new()
	center_container.add_child(vbox)  # Add VBox to CenterContainer

	# Image container for unit icon
	var image_margin = MarginContainer.new()
	image_margin.set_custom_minimum_size(Vector2(0, 64))
	var texture_rect = TextureRect.new()
	texture_rect.texture = unit_icon
	texture_rect.expand = true
	texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	image_margin.add_child(texture_rect)
	vbox.add_child(image_margin)

	# Label for unit name
	var name_label = Label.new()
	name_label.text = unit_name
	name_label.set_custom_minimum_size(Vector2(0, 30))  # Set minimum height
	vbox.add_child(name_label)

	# Label for unit cost
	var cost_label = Label.new()
	cost_label.text = "Cost: " + str(unit_cost)
	cost_label.set_custom_minimum_size(Vector2(0, 30))  # Set minimum height
	vbox.add_child(cost_label)

	# Return the configured button
	return button

# Function to populate the UI with unit buttons in _ready()
func _ready():
	# Access the HBoxContainer to hold buttons (replace with actual path in your scene)
	var hbox = $VBoxContainer/MarginContainer/ScrollContainer/HBoxContainer
	hbox.size_flags_horizontal = Control.SIZE_EXPAND | Control.SIZE_FILL

	# Create and add a button for each unit in unit_data
	for unit in unit_data:
		var unit_button = create_unit_button(unit["icon"], unit["name"], unit["cost"])
		hbox.add_child(unit_button)
