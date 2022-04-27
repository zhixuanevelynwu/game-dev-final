/// @description Insert description here
// You can write your code in this editor
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

if (face_up) {
	draw_sprite(sprite_index, img_index, x, y);
} else {
	draw_sprite(sprite_index, 0, x, y);
}

