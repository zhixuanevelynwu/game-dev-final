/// @description Insert description here
// You can write your code in this editor
if (!deactivated && global.state == global.state_input) {
	if (!activated) {
		if (abs(x - target_x) > 1) {
			x = lerp(x, target_x, 0.2);
		} else {
			x = target_x;
		}

		if (abs(y - target_y) > 1) {
			y = lerp(y, target_y, 0.2);
		} else {
			y = target_y;
		}
	}
} else {
	image_index = 1;
	image_speed = 0;
}

draw_self();
