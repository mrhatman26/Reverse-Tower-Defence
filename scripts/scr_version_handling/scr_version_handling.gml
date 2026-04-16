function version_read(show_errors=false){
	version_file = file_text_open_read("version.txt");
	while (!file_text_eof(version_file)){
		var version = file_text_readln(version_file);
		try{
			global.current_version = string_split(version, ".");
			try{
				for (var i = 0; i < array_length(global.current_version); i++){
					global.current_version[i] = int64(global.current_version[i]);
				}
			}
			catch (_exception){
				show_message("ERROR: Version file has invalid characters!");
				global.current_version = [-1, -1, -1];
			}
		}
		catch (_exception){
			show_message("ERROR: Version file has no '.' delimiter!");
			global.current_version = [-1, -1, -1];
		}
		if (array_length(global.current_version) != 3){
			show_message("ERROR: Version file has incorrect format!");
			global.current_version = [-1, -1, -1];
		}
		break;
	}
	file_text_close(version_file);
}

function version_get_string(){
	return string(global.current_version[0]) + "." + string(global.current_version[1]) + "." + string(global.current_version[2]);
}

function version_write_new_version(){
	version_file = file_text_open_write("version.txt");
	file_text_write_string(version_file, version_get_string());
	file_text_close(version_file);
}

function version_update(){
	global.current_version[2] += 1;
	if (show_question("Build version incremented. Version is now " + version_get_string() + "\nWould you like to increment the major or minor version numbers?")){
		global.current_version[2] = 0;
		if (show_question("Is this version a minor version?")){
			global.current_version[1] += 1;
			show_message("Minor version incremented.\nVersion is now: " + version_get_string());
		}
		else{
			global.current_version[0] += 1;
			show_message("Major version incremented and build version set to 0.\nVersion is now: " + version_get_string());
		}
	}
	version_write_new_version();
}