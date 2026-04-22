function soldier_create(){
	if (mouse_check_button_pressed(mb_left)){
		var new_soldier = instance_create_depth(path_get_x(pth_default, 0), path_get_y(pth_default, 0), -1, obj_player_soldier);
		new_soldier.created = true;
	}
}