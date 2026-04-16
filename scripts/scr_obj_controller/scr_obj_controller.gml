function controller_check_escape_restart(){
	if (keyboard_check(vk_escape) || keyboard_check(vk_end)){
		game_end();
	}
	if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("R"))){
		room_restart();
	}
}

function controller_create_system_objects(){
	for (var i = 0; i < array_length(system_objects); i++){
		if (!instance_exists(system_objects[i])){
			instance_create_depth(x + (32 * i), y, -99, system_objects[i]);
		}
	}
}