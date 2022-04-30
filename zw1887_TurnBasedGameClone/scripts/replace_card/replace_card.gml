// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function replace_card(){
	with (obj_game_manager) {
		discard_current_y = discard_pile_y;
		c = global.discard_pile[|0];
		c.face_up = false;
		c.target_x = deck_x;
		c.target_y = deck_y;
		ds_list_delete(global.discard_pile, 0);
		ds_list_add(temp_list, c);
		audio_play_sound(snd_deal, 10, 0);
	}
}