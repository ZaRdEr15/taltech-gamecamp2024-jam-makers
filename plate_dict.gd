extends Node

var inv_items: Dictionary = {
	"Blank": "res://inv_ui/inv_item/blankPlate.tres",
	"Arrow": "res://inv_ui/inv_item/Arrow.tres",
	"Back": "res://inv_ui/inv_item/Back.tres"
}

var plate_nodes: Dictionary = {
	"Blank": preload("res://plate/base_plate.tscn"),
	"Arrow": preload("res://plate/arrow_plate.tscn"),
	"Back": preload("res://plate/base_plate.tscn")
}
