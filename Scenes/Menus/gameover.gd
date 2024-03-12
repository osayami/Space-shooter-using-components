extends Control

const SAVE_PATH = "user://save.cfg"
const TEST_SAVE_PATH = "res://save.cfg"

var save_path = SAVE_PATH

@export var game_stats: GameStats
@onready var score_value: Label = %ScoreValue
@onready var high_score_value: Label = %HighScoreValue


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_highscore()
	
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
		save_highscore()
		
	score_value.text = str(game_stats.score)
	high_score_value.text = str(game_stats.highscore)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://Scenes/Menus/menu.tscn")
		
		
func load_highscore() -> void:
	var config = ConfigFile.new()
	var error = config.load(save_path)
	if error != OK : return
	game_stats.highscore = config.get_value("game","highscore")
	
func save_highscore() -> void:
	var config = ConfigFile.new()
	config.set_value("game","highscore",game_stats.highscore)
	config.save(save_path )
