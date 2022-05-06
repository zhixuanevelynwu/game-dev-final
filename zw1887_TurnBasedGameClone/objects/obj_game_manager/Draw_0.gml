/// @description Insert description here
// You can write your code in this editor
draw_set_font(dogica);
draw_set_color(c_white);
draw_text(deck_x, room_height / 10 * 8, global.score0);
draw_text(deck_x, room_height / 5, global.score1);
draw_text(discard_pile_x, room_height / 5, "Round " 
	+ string(global.round) 
	+ "/" 
	+ string(global.num_rounds));

draw_set_halign(fa_center);

if (obj_clairvoyant.selected) {
	draw_text(room_width / 2, room_height / 2, "View the opponent's cards ("
		+ string(obj_clairvoyant.times_used)
		+ "/" 
		+ string(obj_clairvoyant.max_time)
		+ ")");
} else if (obj_swap.selected) {
	draw_text(room_width / 2, room_height / 2, "Swap one card ("
		+ string(obj_swap.times_used)
		+ "/" 
		+ string(obj_swap.max_time)
		+ ")"
	);
} else {
	switch (global.state) {
		case global.state_input:
			draw_text(room_width / 2, room_height / 2, "Select two cards");
			break;
		case global.state_takeback:
			draw_text(room_width / 2, room_height / 2, "Take one card back");
			break;
		case global.state_rebuild:
			draw_text(room_width / 2, room_height / 2, "Round " + string(global.round));
			break;
	}
}
