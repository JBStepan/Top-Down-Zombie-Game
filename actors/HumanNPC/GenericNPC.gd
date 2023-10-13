extends CharacterBody2D

@export var current_state: int = 0
@export var npc_name: String = ""

var id = null

@onready var ai = $HumanAI

# Called when the node enters the scene tree for the first time.
func _ready():
	id = generate_id()
	set_name.call_deferred(id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_id():
	return id


func generate_id():
	var chars = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "x", "y", "z"]
	var word: String
	var n_char = len(chars)
	for i in range(18):
		word += chars[randi()% n_char]
	return word
