/// @description Insert description here
// You can write your code in this editor
if (!deactivated) {
	if (position_meeting(mouse_x, mouse_y, id)) {
		target_y = orig_y - dist_y;
		selected = true;
		if (mouse_check_button(mb_left) 
			&& global.state == global.state_input) {
			activated = true;
			image_speed = 1;
		}
	} else {
		target_y = orig_y;
		selected = false;
	}
	
	if (activated && global.state == global.state_compare) {
		times_used ++;
		activated = false;
		swapped = false;
		target_y = orig_y;
	}
	
	if (global.state == global.state_input) {
		sprite_index = my_sprite;
	} else {
		sprite_index = my_sprite_gray
	}
	
	if (max_time <= times_used) {
		deactivated = true;
		y = orig_y;
	}
}
