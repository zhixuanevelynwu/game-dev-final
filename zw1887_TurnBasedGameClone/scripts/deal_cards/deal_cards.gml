// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function deal_cards(){
	with (obj_game_manager) {
		num_hand0 = ds_list_size(global.hand0);
		num_hand1 = ds_list_size(global.hand1);
		
		if (ds_list_size(global.discard_pile) == num_cards) {
			wait_timer = 0;
			global.round += 1;
			if (global.round > global.num_rounds) {
				room_goto(Rm_End);
			} else {
				global.state = global.state_rebuild;
			}
		} else if (wait_timer % 10 == 0) {
			if (num_hand1 < max_hand) {
				dealt_card = global.deck[|0];
				dealt_card.dealt = true;
				ds_list_add(global.hand1, dealt_card);
				ds_list_delete(global.deck, 0);
				dealt_card.in_hand = false;
				dealt_card.target_x = room_width / 2 + ((num_hand1 - 1) * (card_width + spacing));
				dealt_card.target_y = global.ai_hand_y;
				audio_play_sound(snd_deal ,10 ,0);
			} else if (num_hand0 < max_hand) {
				dealt_card = global.deck[|0];
				dealt_card.dealt = true;
				ds_list_add(global.hand0, dealt_card);
				ds_list_delete(global.deck, 0);
				dealt_card.in_hand = true;
				dealt_card.target_x = room_width / 2 + ((num_hand0 - 1) * (card_width + spacing));
				dealt_card.target_y = global.player_hand_y;
				audio_play_sound(snd_deal ,10 ,0);
			} else if (wait_timer > 120) {
				global.state = global.state_input;
				wait_timer = 0;
			}
		}
		wait_timer ++;
	}
}