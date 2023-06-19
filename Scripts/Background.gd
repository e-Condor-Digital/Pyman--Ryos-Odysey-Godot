extends ParallaxBackground

@onready var mc = $MC/Personaje
@onready var bird = $Birds/birds
@onready var bird2 = $Birds/birds2
@onready var bird3 = $Birds/birds3
@onready var bird4 = $Birds/birds4
@onready var bird5 = $Birds/birds5
@onready var bird6 = $Birds/birds6
@onready var bird7 = $Birds/birds7
@onready var bird8 = $Birds/birds8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_base_offset.x -= 20*delta
	mc.play("Idle")
	bird.play("fly")
	bird2.play("fly")
	bird3.play("fly")
	bird4.play("fly")
	bird5.play("fly")
	bird6.play("fly")
	bird7.play("fly")
	bird8.play("fly")
