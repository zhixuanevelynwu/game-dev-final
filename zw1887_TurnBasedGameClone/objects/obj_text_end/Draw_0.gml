/// @description Insert description here
// You can write your code in this editor
draw_set_font(dogica);
draw_set_color(c_white);
draw_set_halign(fa_center);
//1062, 411
if (global.score0 > global.score1) {
	draw_text(1062, 411, "You won!");
} else if (global.score0 == global.score1) {
	draw_text(1062, 411, "It's a tie...");
} else {
	draw_text(1062, 411, "You lost.");
}
