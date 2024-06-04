extends RichTextLabel

var time_start = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	time_start = Time.get_ticks_msec()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = Vector2(-get_viewport_rect().size / 2)
	self.text = str(Time.get_ticks_msec() - time_start)
