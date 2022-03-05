extends KinematicBody2D


onready var fist_pivot = $FistPivot

var velocity = Vector2.ZERO
var press_position = Vector2.ZERO
var release_position = Vector2.ZERO
var player_state = IDLE

const GRAVITY : int = 50
const TERM_VEL : int = 500
const PUNCH_FORCE : int  = 200

enum {
	PUNCH,
	IDLE,
	AIR
}

func _unhandled_input(event):
	pass
		

func _physics_process(delta):
	
	match player_state:
		IDLE:
			fist_pivot.look_at(get_global_mouse_position())
			
		PUNCH:
			var vec = press_position - release_position
			print(vec.length())
			
		AIR:
			pass
		
	velocity.y = move_toward(velocity.y, TERM_VEL, GRAVITY)
	move_and_slide(velocity, Vector2.UP)
