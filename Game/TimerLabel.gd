extends Label

func _process(_delta):
	text = str(get_parent().timer_value)
	
