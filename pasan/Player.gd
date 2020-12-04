extends KinematicBody2D

const ACCELERATION = 512
const MAX_SPEED = 96
const FRICTION = 0.25
const AIR_RESISTANCE = 0.02
const GRAVITY = 200
const JUMP_FORCE = 128
const grav = 9.80665

var motion = Vector2.ZERO
var x_input

onready var sprite = $sprite
onready var animationPlayer = $AnimationPlayer


func _physics_process(delta):
	
	
	x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		motion.x += x_input * ACCELERATION * delta
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		sprite.flip_h = x_input < 0 
		animationPlayer.play("beg(run kotorii)")
	else:
		animationPlayer.play("stoit")
	
	motion.y += GRAVITY * delta
	
	if test_move(transform, Vector2.UP):
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION)
			
		if Input.is_action_just_released("ui_up"):
			motion.y = -JUMP_FORCE
	else:
		animationPlayer.play("prigaet(jump)")
		if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/2:  
			motion.y = -JUMP_FORCE/2

		if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE)
	
	
	motion = move_and_slide(motion, Vector2.UP)
