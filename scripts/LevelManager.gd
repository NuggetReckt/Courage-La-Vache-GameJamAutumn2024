extends Node2D

@onready var player_counter: Label = $PlayerCounter
@onready var day_timer: Timer = $DayTimer
@onready var transition_timer: Timer = $TransitionTimer
@onready var alien_victory_screen: Sprite2D = $AlienVictoryScreen
@onready var cows_victory_screen: Sprite2D = $CowsVictoryScreen
@onready var end_timer: Timer = $EndTimer

@export var generators : Array[Node2D]

var night : bool
var is_game_ended: bool

func _ready() -> void:
	day_timer.start()
	is_game_ended = false
	night = false
	
	Main.generator_charge_count = 0
	Main.players_alive_count = Main.moving_players.size()
	
	alien_victory_screen.visible = false
	cows_victory_screen.visible = false
	
	if(Main.players_alive_count == 1): #On met que 3 gens si 1v1
		var gen = generators[generators.size() - 1]
		gen.visible = false
		generators.erase(gen)
		
	
	if (AudioManager.menu_theme.playing):
		AudioManager.menu_theme.stop()
	await get_tree().create_timer(0.5).timeout
	AudioManager.game_start_sfx.play()

func _process(delta: float) -> void:
	set_game_ended()
	
	#jour/nuit
	if (!night):
		$CowCounterFaceAlive.visible = false
		if (!transition_timer.is_stopped()):
			#set alpha
			var alpha_percentage = (transition_timer.wait_time - transition_timer.time_left)/transition_timer.wait_time
			find_child("hunter").black_hole.modulate = Color(1,1,1,alpha_percentage)
		else:
			find_child("hunter").black_hole.modulate = Color(1,1,1,0)
	else:
		find_child("hunter").black_hole.modulate = Color(1,1,1,1)
	
	#conditions de win
	if (is_game_ended):
		if (AudioManager.game_theme.playing):
			AudioManager.game_theme.stop()
		if (AudioManager.game_theme_no_intro.playing):
			AudioManager.game_theme_no_intro.stop()
		if(!AudioManager.game_end_sfx.playing):
			AudioManager.game_end_sfx.play()
		if (Main.generator_charge_count >= 3):
			cows_victory_screen.visible = true
			if (end_timer.is_stopped()):
				end_timer.start()
				print("les vaches ont gagné !")
			return
		if (Main.players_alive_count <= 0):
			alien_victory_screen.visible = true
			if (end_timer.is_stopped()):
				end_timer.start()
				print("le chasseur à gagné !")
			return
	
	if (night):
		if (!$CowCounterFaceAlive.visible):
			$CowCounterFaceAlive.visible = true
		player_counter.text = str(Main.players_alive_count)

func set_game_ended() -> void:
	if (Main.players_alive_count <= 0 or Main.generator_charge_count >= 3):
		is_game_ended = true

func _on_day_timer_timeout() -> void:
	play_music()
	transition_timer.start()

func _on_transition_timer_timeout() -> void:
	night = true
	
func play_music() -> void:
	AudioManager.game_theme.play()
	await get_tree().create_timer(AudioManager.game_theme.stream.get_length()).timeout
	AudioManager.game_theme_no_intro.play()

func _on_end_timer_timeout() -> void:
	Main.moving_players.clear()
	get_tree().change_scene_to_file("res://scenes/Levels/MainMenu.tscn")
