extends AI
class_name HumanAI

enum State {
	IDLE=0,
	TALKING,
	LOOKING
}

@export_category("Human AI")
@export var detection_shape: Shape2D

@onready var detection_zone = $DetectionZone
@onready var collision = $DetectionZone/CollisionShape2D

var target: CharacterBody2D = null
var current_state: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	collision.shape = detection_shape


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match current_state:
		State.IDLE:
			pass
		State.LOOKING:
			actor.look_at(target.global_position)
		_:
			print("Error")

func _on_detection_zone_body_entered(body):
	if body.name != actor.name:
		target = body
		print(target.name)
		set_state(State.LOOKING)
		
func _on_detection_zone_body_exited(body):
	actor.look_at(Vector2.LEFT)
	set_state(State.IDLE)
	
func set_state(new_state):
	emit_signal("state_changed", current_state, new_state)
	current_state = new_state


