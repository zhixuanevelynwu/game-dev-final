// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function take_back(){
	with (obj_game_manager) {
		if (wait_timer >= 60) {
			ai_selected_card0.face_up = true;
			ai_selected_card1.face_up = true;
		
			if (mouse_check_button(mb_left) && global.selected_card != noone && !taken_back) {
				taken_back = true;
				if (global.selected_card == selected_card0) {
					selected_card0.target_y = global.player_hand_y;
					player_selected_card = selected_card1;
				} else {
					selected_card1.target_y = global.player_hand_y;
					player_selected_card = selected_card0;
				}
				audio_play_sound(snd_deal ,10 ,0);
				selected_card0 = noone;
				selected_card1 = noone;
			}
			
			if (taken_back) {
				wait_timer = 0;
				// take ai's card back
				r = irandom_range(0, 1);
				if (r == 0) {
					ai_selected_card = ai_selected_card0;
					ai_selected_card1.target_y = global.ai_hand_y;
				} else {
					ai_selected_card = ai_selected_card1;
					ai_selected_card0.target_y = global.ai_hand_y;
				}
				ai_selected_card0 = noone;
				ai_selected_card1 = noone;
				taken_back = false;
				global.state = global.state_compare; 
			}
		}
		
		wait_timer ++;
	}
}