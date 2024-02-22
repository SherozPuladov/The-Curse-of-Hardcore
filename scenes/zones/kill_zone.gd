extends Area2D

func kill(body):
	body.respawn_player.emit()
	body.send_cause_of_dead_message.emit("Murdered")
