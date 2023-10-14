extends Control

@export_node_path("Label") var label_path
@onready var fps_label: Label = get_node(label_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fps_label.set_text("FPS: %s" % Engine.get_frames_per_second())
