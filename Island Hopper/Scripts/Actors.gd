class_name Actor
extends CharacterBody2D

@export var max_speed: float
@export var jump_velocity: float
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

