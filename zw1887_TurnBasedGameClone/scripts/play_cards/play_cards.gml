// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_cards(){
	with (obj_game_manager) {
		// ai display one random card
		if (obj_clairvoyant.activated) {
			for (i = 0; i < ds_list_size(global.hand1); i++) {
				global.hand1[|i].face_up = true;
			}
		} 
		
		if (obj_swap.activated && !obj_swap.swapped) {
			i0 = irandom_range(0, 2);
			i1 = irandom_range(0, 2);
			s0 =  global.hand0[|i0];
			s1 =  global.hand1[|i1];
			s0.in_hand = false;
			s1.in_hand = true;
			s1.displayed = false;
			if (ai_selected_card0 == s1) {
				ai_selected_card0 = s0;
			} else if (ai_selected_card1 == s1) {
				ai_selected_card1 = s0;
			}
			ds_list_delete(global.hand0, i0);
			ds_list_delete(global.hand1, i1);
			ds_list_add(global.hand1, s0);
			ds_list_add(global.hand0, s1);
			s0.target_x = s1.x;
			s0.target_y = s1.y;
			s1.target_x = s0.x;
			s1.target_y = s0.y;
			obj_swap.swapped = true;
		}
		
		if (wait_timer == 60) {
			index0 = irandom_range(0, 2);
			ai_selected_card0 = global.hand1[|index0];
			ds_list_delete(global.hand1, index0);
			ai_selected_card1 = global.hand1[|irandom_range(0, 1)];
			ds_list_add(global.hand1, ai_selected_card0);
			ai_selected_card0.target_y = global.ai_hand_y + sprite_get_height(spr_card) + spacing;
			ai_selected_card1.target_y = global.ai_hand_y + sprite_get_height(spr_card) + spacing;
			global.ai_turn = true;
			audio_play_sound(snd_deal ,10 ,0)
		}
		
		if (mouse_check_button(mb_left) 
			&& global.selected_card != noone
			&& !obj_ability.selected) {
			// move selected card up
			if (selected_card0 == noone) {
				selected_card0 = global.selected_card;
				selected_card0.displayed = true;
				selected_card0.target_y =  global.player_hand_y - sprite_get_height(spr_card) - spacing;
				audio_play_sound(snd_deal, 10, 0);
			} else if (selected_card1 == noone && global.selected_card != selected_card0) {
				selected_card1 = global.selected_card;
				selected_card1.displayed = true;
				selected_card1.target_y =  global.player_hand_y - sprite_get_height(spr_card) - spacing;
				audio_play_sound(snd_deal, 10, 0);
			}
		}	
		
		if (selected_card1 != noone && global.ai_turn) {
			global.state = global.state_takeback;
			global.ai_turn = false;
			wait_timer = 0;
			snd_deal_played = false;
		}
		wait_timer ++;
	}
}