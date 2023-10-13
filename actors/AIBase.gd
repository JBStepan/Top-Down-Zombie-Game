extends Node2D
class_name AI

signal state_changed(old_state, new_state)

@export_category("Roots")
@export_node_path("CharacterBody2D") var actor_path
@export_node_path("Node2D") var weapon_path
@export_node_path("Timer") var state_timer_path

@export_group("Combat")
@export var combat_enabled:  bool = true
@export var combat_timer: float = 0.7
@export var in_combat: bool = false

@export_group("State Timer")
@export var state_timer: float = 1.0
@export var enable_state_timer: bool = true

@onready var timer: Timer = get_node(state_timer_path)
@onready var actor: CharacterBody2D = get_node(actor_path)



# Called when the node enters the scene tree for the first time.
func _ready():
	if enable_state_timer == true:
		timer.wait_time = state_timer
	
	timer.connect("timeout", _on_state_timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_state_timer_timeout():
	pass
