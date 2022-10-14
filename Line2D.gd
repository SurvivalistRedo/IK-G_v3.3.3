extends Line2D

var prevPointPosition = []

func _ready():
	for p in range(points.size()-1):
		prevPointPosition.append(points[p])

func place():
	points[points.size()-1] = get_global_mouse_position()

func _process(delta):
	for n in range(100):
		place()
		for p in range(points.size()-2,-1,-1):
			points[p] = normalizeDist(points[p],points[p+1],5)
		for p in range(1,points.size(),1):
			points[p] = normalizeDist(points[p],points[p-1],5)

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
