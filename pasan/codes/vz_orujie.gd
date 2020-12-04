extends KinematicBody2D



onready var player = get_node("../Player")
var poloj = Vector2.ZERO
var k = false
var l = true
var meow = true
var z_input

onready var sprite1 = $pistol1
onready var sprite2 = $pistol1vruke



func _ready():
	pass 
	
func v_ruke():
	poloj.x = player.motion.x
	poloj.y = player.motion.y
	if player.x_input != 0:
		sprite2.flip_h = player.x_input < 0

	move_and_slide(poloj, Vector2.UP)

	
func _process(delta):
	if l:
		z_input = Input.get_action_strength("ui_accept")
	
	if k == true and z_input == 1:
		l = false
		z_input = 1
		if meow:
			remove_child(sprite1)
			meow = false
		v_ruke()


func _on_PlayerDetector_body_entered(body):
	k = true
		



# ∧＿∧
#( ･ω･｡)つ━☆・*。
#⊂　 ノ 　　　・゜+.            опля и оно работает!
#しーＪ　　　°。+ *´¨)
#　　　　　　　　　.· ´¸.·*´¨) ¸.·*¨)
#　　　　　　　　　　(¸.·´ (¸.·'* ☆
