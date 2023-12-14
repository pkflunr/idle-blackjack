extends ScrollContainer

@export var widget_scene:PackedScene
@onready var widget_container = $VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	for idle_process_key in Stats.idle_process_dict:
		var new_widget = widget_scene.instantiate()
		new_widget.set_idle_process(Stats.idle_process_dict[idle_process_key])
		widget_container.add_child(new_widget)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
