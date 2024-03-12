class_name MoveComponent
extends Node

@export var actor : Node2D
@export var velocity : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	actor.translate(velocity * delta)
