extends Node2D

onready var animation_tree = get_node("AnimationTree")
onready var animation_mode = animation_tree.get("parameters/playback")
onready var player = get_node("RigidBody2D/body")
onready var skeleton = get_node("RigidBody2D/body/Skeleton2D")
onready var right_hand = $RigidBody2D/body/Skeleton2D/hip/breast/right_body/right_upper_arm/right_lower_arm/right_hand

var moving = false

func _unhandled_input(event):
	if event.is_action_pressed("player_left"):
		animation_tree.set('parameters/walking/blend_position', Vector2(-1, 0))
		animation_mode.travel('walking')
		player.set_scale(Vector2(-1,1))
	elif event.is_action_pressed("player_right"):
		animation_tree.set('parameters/walking/blend_position', Vector2(1, 0))
		animation_mode.travel('walking')
		player.set_scale(Vector2(1,1))
	elif event.is_action_pressed("player_down"):
		animation_mode.travel('idle')

func _process(delta):
	print(str(get_global_mouse_position()))
	right_hand.position = player.position - get_global_mouse_position()
