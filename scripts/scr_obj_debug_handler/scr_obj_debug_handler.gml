function debug_handler_key_toggle(){
	if (keyboard_check_pressed(vk_f12)){
		global.debug = !global.debug;
	}
}