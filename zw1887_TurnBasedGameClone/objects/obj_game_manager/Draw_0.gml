/// @description Insert description here
// You can write your code in this editor
draw_set_font(dogica);
draw_set_color(c_white);
draw_text(40, room_height / 15 * 13, score0);
draw_text(40, room_height / 15, score1);

draw_set_halign(fa_center);
switch (global.state) {
	case global.state_input:
		draw_text(room_width / 2, room_height / 2, "Select two cards");
		break;
	case global.state_takeback:
		draw_text(room_width / 2, room_height / 2, "Take one card back");
		break;
}