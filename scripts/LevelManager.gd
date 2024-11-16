extends Node2D

@onready var player_counter: Label = $PlayerCounter
@onready var day_timer: Timer = $DayTimer
@onready var transition_timer: Timer = $TransitionTimer
@onready var end_timer: Timer = $EndTimer
@onready var alien_victory_screen: Sprite2D = $AlienVictoryScreen
@onready var cows_victory_screen: Sprite2D = $CowsVictoryScreen

var night : bool
var is_game_ended: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	day_timer.start()
	is_game_ended = false
	night = false
	Main.generator_charge_count = 0
	Main.players_alive_count = 3	
	if (AudioManager.menu_theme.playing):
		AudioManager.menu_theme.stop()
	alien_victory_screen.visible = false
	cows_victory_screen.visible = false

func _process(delta: float) -> void:
	set_game_ended()
	
	#jour/nuit
	if(!night):
		$CowCounterFaceAlive.visible = false
		if(!transition_timer.is_stopped()):
			#set alpha
			var alpha_percentage = (transition_timer.wait_time - transition_timer.time_left)/transition_timer.wait_time
			find_child("hunter").black_hole.modulate = Color(1,1,1,alpha_percentage)

		else:
			find_child("hunter").black_hole.modulate = Color(1,1,1,0)

	else:
		find_child("hunter").black_hole.modulate = Color(1,1,1,1)
	
	#conditions de win
	if (is_game_ended):
		if (Main.generator_charge_count >= 3):
			print("les vaches ont gagné !")
			cows_victory_screen.visible = true
			if(end_timer.is_stopped()):
				end_timer.start()
			return
		if (Main.players_alive_count <= 0):
			print("le chasseur à gagné !")
			alien_victory_screen.visible = true
			if(end_timer.is_stopped()):
				end_timer.start()
			return
		AudioManager.game_end_sfx.play()
	
	if(night):
		if(!$CowCounterFaceAlive.visible):
			$CowCounterFaceAlive.visible = true
		player_counter.text = str(Main.players_alive_count)

func set_game_ended() -> void:
	if (Main.players_alive_count <= 0 or Main.generator_charge_count >= 3):
		is_game_ended = true

func _on_day_timer_timeout() -> void:
	transition_timer.start()

func _on_transition_timer_timeout() -> void:
	AudioManager.game_start_sfx.play()
	night = true
	await get_tree().create_timer(AudioManager.game_start_sfx.stream.get_length() + 1).timeout
	AudioManager.game_theme.play()

func _on_end_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/MainMenu.tscn")
