/*VARIABLES*/
//Macros
#macro DEVELOPER_MODE true
//Debug global vars
global.debug = false;
//Version global vars
global.current_version = [-2, -2, -2];
/*STARTUP CODE*/
version_read();
//Developer mode startup
if (DEVELOPER_MODE){
	if (show_question("Enable debug mode?")){
		global.debug = true;
	}
	//Version Updating
	version_update();
}