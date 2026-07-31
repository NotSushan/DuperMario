extends HSlider

# Default to "Master" bus so you don't need to type it in the Inspector
@export var audio_bus_name: String = "Master"

var audio_bus_id: int

func _ready() -> void:
	# Get the bus index safely
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	
	# Set slider starting position to current bus volume
	if audio_bus_id != -1:
		var current_db = AudioServer.get_bus_volume_db(audio_bus_id)
		value = db_to_linear(current_db)

func _on_value_changed(value: float) -> void:
	# Fallback check in case ready hasn't assigned it yet
	if audio_bus_id == -1 or audio_bus_id == null:
		audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
		
	if audio_bus_id != -1:
		var db = linear_to_db(value)
		AudioServer.set_bus_volume_db(audio_bus_id, db)
		# Mute when slider reaches 0
		AudioServer.set_bus_mute(audio_bus_id, value == 0)
		
