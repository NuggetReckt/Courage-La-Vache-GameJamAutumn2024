extends Node

@onready var mooh_1_sfx: AudioStreamPlayer = $Mooh1SFX
@onready var mooh_2_sfx: AudioStreamPlayer = $Mooh2SFX
@onready var mooh_3_sfx: AudioStreamPlayer = $Mooh3SFX
@onready var game_start_sfx: AudioStreamPlayer = $GameStartSFX
@onready var game_end_sfx: AudioStreamPlayer = $GameEndSFX
@onready var catch_attempt_1_sfx: AudioStreamPlayer = $CatchAttempt1SFX
@onready var catch_attempt_2_sfx: AudioStreamPlayer = $CatchAttempt2SFX
@onready var catch_1_sfx: AudioStreamPlayer = $Catch1SFX
@onready var catch_2_sfx: AudioStreamPlayer = $Catch2SFX
@onready var menu_theme: AudioStreamPlayer = $MenuTheme
@onready var game_theme: AudioStreamPlayer = $GameTheme
@onready var generator_fill: AudioStreamPlayer = $GeneratorFill
@onready var generator_full: AudioStreamPlayer = $GeneratorFull

var random = RandomNumberGenerator.new()

var moohs: Array[AudioStreamPlayer] = [mooh_1_sfx, mooh_2_sfx, mooh_3_sfx]
var catches: Array[AudioStreamPlayer] = [catch_1_sfx, catch_2_sfx]
var catche_attempts: Array[AudioStreamPlayer] = [catch_attempt_1_sfx, catch_attempt_2_sfx]

func get_rand_mooh() -> AudioStreamPlayer:
	return moohs[random.randi_range(0, moohs.size())]

func get_rand_catch() -> AudioStreamPlayer:
	return catches[random.randi_range(0, catches.size())]
	
func get_rand_catch_attempt() -> AudioStreamPlayer:
	return catche_attempts[random.randi_range(0, catche_attempts.size())]
