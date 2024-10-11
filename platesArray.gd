extends Node2D

@export var plateArray: Array[Plate]

func test():
	var plate: Plate = plateArray[0]
	var anotherplate = plate.duplicate()
	plateArray.append(anotherplate)
	
