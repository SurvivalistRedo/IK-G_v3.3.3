extends Line2D

func _ready():
	OS.set_window_per_pixel_transparency_enabled(true)

func _process(delta):
	points[points.size()-1] = get_global_mouse_position() #Vector2(rand_range(250,750),rand_range(250,750))
	for i in range(100):
		for n in range(points.size()-2,-1,-1):
			points[n] = normalizeDist(points[n],points[n+1],5)
	for i in range(100):
		for n in range(1,points.size(),1):
			points[n] = normalizeDist(points[n],points[n-1],5)

func normalizeDist(MovingVector,TargetVector,dist):
	var angle = 0
	if TargetVector.x > MovingVector.x:
		angle = atan( (TargetVector.y - MovingVector.y) / (TargetVector.x - MovingVector.x) )
	elif TargetVector.x == MovingVector.x:
		angle = NAN
	elif TargetVector.x < MovingVector.x:
		angle = PI + atan( (TargetVector.y - MovingVector.y) / (TargetVector.x - MovingVector.x) )
	if angle == angle:
		angle = angle
	elif angle != angle:
		angle = rand_range(-0.5*PI,1.5*PI)
	return Vector2(TargetVector.x - (dist * cos(angle)),TargetVector.y - (dist * sin(angle)))
