extends Node3D
class_name StaticPlayer

var mouse_sensitivity = 0.03125
var prev_x_coordinate: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("look"):
			# https://kidscancode.org/godot_recipes/3.x/3d/camera_gimbal/index.html
			rotate_object_local(Vector3.UP, event.relative.x * mouse_sensitivity * 0.05)
			var y_rotation = clamp(event.relative.y, -30, 30)
			$Head.rotate_object_local(Vector3.RIGHT, y_rotation * mouse_sensitivity * 0.05)
			$Head.rotation_degrees.x = clamp($Head.rotation_degrees.x, -90, 90)
			#rotation.y -= event.relative.x * mouse_sensitivity * 0.05
			#rotation.x -= event.relative.y * mouse_sensitivity * 0.05
			#rotation_degrees.y = clamp(rotation_degrees.y, -90, 90)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
