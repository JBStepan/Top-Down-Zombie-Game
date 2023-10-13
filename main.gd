extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in self.get_children():
		print(i.name)

func _input(event):
	if event.is_action_pressed("ui_home"):
		for i in self.get_children():
			print(i.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
