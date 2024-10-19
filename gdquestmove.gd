extends CharacterBody2D

signal health_depleted

var Level = 0
var ExperiencePoints = 0
var health = 10.0
#const SPEED = 300.0
func ready():
	print(self.get_path())

func level_up():
	ExperiencePoints +=1
	if ExperiencePoints % 10 == 0:
		Level += 1
		print("You have reached level " + str(Level) + ".")

func _physics_process(delta):
	var direction = Input.get_vector("left", "right","up", "down")
	velocity = direction * 600
	move_and_slide()

	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()

	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
