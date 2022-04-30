// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function discard_cards(){
	with (obj_game_manager) {
		if (wait_timer == 120) {
			ai_selected_card.target_x = discard_pile_x;
			ai_selected_card.target_y = discard_current_y;
			audio_play_sound(snd_deal ,10 ,0);
		} else if (wait_timer == 130){
			global.selected_card.target_x = discard_pile_x;
			global.selected_card.target_y = discard_current_y;
			audio_play_sound(snd_deal ,10 ,0);
		} else if (wait_timer >= 140 && wait_timer % 10 == 0) {
			global.selected_card = noone;
			ai_selected_card = noone;
			player_selected_card = noone;
			
			if (ds_list_size(global.hand1) > 0) {
				c = global.hand1[|0];
				c.dealt = false;
				c.face_up = true;
				c.target_x = discard_pile_x;
				c.target_y = discard_current_y;
				c.displayed = false;
				discard_current_y += offset;
				ds_list_delete(global.hand1, 0);
				ds_list_add(global.discard_pile, c);
			} else if (ds_list_size(global.hand0) > 0) {
				c = global.hand0[|0];
				c.dealt = false;
				c.face_up = true;
				c.target_x = discard_pile_x;
				c.target_y = discard_current_y;
				c.displayed = false;
				discard_current_y += offset;
				ds_list_delete(global.hand0, 0);
				ds_list_add(global.discard_pile, c);
			}

			audio_play_sound(snd_deal ,10 ,0);
		}
	}
}