extends Node

onready var v1 = Vector3(0,0,0)
onready var v2 = Vector3(0,0,0)
onready var pre = Vector3(0,0,0)
onready var result = Vector3(0,0,0)

onready var question_title = $question/title
onready var mode = $HBoxContainer/optionMode
onready var domode = 0
onready var waitTime = 0

onready var answerX = $answers/anserX
onready var answerY = $answers/anserY
onready var answerZ = $answers/anserZ
onready var rightType = $RightType

func wait(sec):
	var frame = sec * Engine.get_iterations_per_second()
	if Engine.get_idle_frames() % int(frame) == 0:
		return true
	else:
		return false
		
func _ready():
	set_process(false)
	
func _process(delta):
	v1.x = floor(rand_range(0,10))
	v1.y = floor(rand_range(0,10))
	v1.z = floor(rand_range(0,10))
	
	v2.x = floor(rand_range(0,10))
	v2.y = floor(rand_range(0,10))
	v2.z = floor(rand_range(0,10))
	
	if wait(waitTime):
		if domode == 1:
			pre = v1 + v2
			question_title.text = "what is " + str(v1) + "+" + str(v2)
			
		elif domode == 2:
			pre = v1-v2
			question_title.text = "what is " + str(v1) + "-" + str(v2)
			
		elif domode == 3:
			pre = v1*v2
			question_title.text = "what is " + str(v1) + "*" + str(v2)
			
		elif domode == 4:
			pre = v1/v2
			question_title.text = "what is " + str(v1) + "/" + str(v2)
		else:
			print("无效参数")
		print(domode)

func _on_start_pressed():
	set_process(true)
	pass


func _on_stop_pressed():
	set_process(false)
	pass

func _on_optionMode_item_selected(index):
	domode = index
	print_debug(domode)
	pass

func _on_optionMode2_text_changed(new_text):
	waitTime = int(new_text)
	pass

func _on_commit_pressed():
	result = Vector3(int(answerX.text),int(answerY.text),int(answerZ.text))
	if pre == result:
		rightType.text = "right"
	else:
		rightType.text = "wrong"
	pass
