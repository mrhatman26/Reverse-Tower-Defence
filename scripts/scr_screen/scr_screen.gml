function screen_get_xcamera(){
	return camera_get_view_x(view_camera[0]);
}

function screen_get_ycamera(){
	return camera_get_view_y(view_camera[0]);
}

function x_to_screen(x_val){
	return x_val - screen_get_xcamera();
}

function y_to_screen(y_val){
	return y_val - screen_get_ycamera();
}

function screen_get_width(half=false){
	if (half){
		return camera_get_view_width(view_camera[0]) / 2;
	}
	else{
		return camera_get_view_width(view_camera[0]);
	}
}

function screen_get_height(half=false){
	if (half){
		return camera_get_view_height(view_camera[0]) / 2;
	}
	else{
		return camera_get_view_height(view_camera[0]);	
	}
}