/// @description Insert description here
// You can write your code in this editor
switch (global.state) {
	case global.state_deal:
		num_hand0 = ds_list_size(global.hand0);
		num_hand1 = ds_list_size(global.hand1);
		
		if (ds_list_size(global.discard_pile) == num_cards) {
			wait_timer = 0;
			global.state = global.state_rebuild;
		} else {
			
			if (num_hand0 < max_hand && num_hand1 == max_hand && frame % 10 == 0) {
				dealt_card = global.deck[|0];
				dealt_card.dealt = true;
				ds_list_add(global.hand0, dealt_card);
				ds_list_delete(global.deck, 0);
				dealt_card.in_hand = true;
				dealt_card.target_x = room_width / 2 + ((num_hand0 - 1) * (card_width + spacing));
				dealt_card.target_y = room_height - room_height / 5;
				audio_play_sound(snd_deal ,10 ,0);
			} 
		
			if (num_hand1 < max_hand && frame % 10 == 0) {
				dealt_card = global.deck[|0];
				dealt_card.dealt = true;
				ds_list_add(global.hand1, dealt_card);
				ds_list_delete(global.deck, 0);
				dealt_card.in_hand = false;
				dealt_card.target_x = room_width / 2 + ((num_hand1 - 1) * (card_width + spacing));
				dealt_card.target_y = room_height / 5;
				audio_play_sound(snd_deal ,10 ,0);
			} 
		
			else if (wait_timer > 120) {
				global.state = global.state_input;
				frame = 0;
				wait_timer = 0;
			}
			frame ++;
			wait_timer ++;
		}
		
		break;

	case global.state_input:
		// ai display one random card
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
		
		if (mouse_check_button(mb_left) && global.selected_card != noone) {
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
		break;
		
	case global.state_takeback:
		
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
		break;
	
	case global.state_compare:
		if (wait_timer == 60) {
			v0 = player_selected_card.img_index;
			v1 = ai_selected_card.img_index;
			if (v0 != v1) {
				if (v0 == ROCK) {
					if (v1 == SCISSOR) {
						score0 += 1;
						audio_play_sound(snd_win, 10, 0);	
					} else {
						score1 += 1;
						audio_play_sound(snd_lose, 10, 0);	
					}
				} else if (v0 == PAPER) {
					if (v1 == ROCK) {
						score0 += 1;
						audio_play_sound(snd_win, 10, 0);	
					} else {
						score1 += 1;
						audio_play_sound(snd_lose, 10, 0);	
					}
				} else if (v0 == SCISSOR) {
					if (v1 == PAPER) {
						score0 += 1;
						audio_play_sound(snd_win, 10, 0);	
					} else  {
						score1 += 1;
						audio_play_sound(snd_lose, 10, 0);		
					}
				}
			} else {
				audio_play_sound(snd_flip, 10, 0);
			}
		} else if (wait_timer == 120) {
			ai_selected_card.target_x = discard_pile_x;
			ai_selected_card.target_y = discard_current_y;
			audio_play_sound(snd_deal ,10 ,0);
		} else if (wait_timer == 130){
			global.selected_card.target_x = discard_pile_x;
			global.selected_card.target_y = discard_current_y;
			audio_play_sound(snd_deal ,10 ,0);
		} else if (wait_timer >= 140 && frame % 10 == 0) {
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
		
		if (ds_list_size(global.hand0) == 0 && ds_list_size(global.hand1) == 0) {
			frame = 0;
			wait_timer = 0;
			global.state = global.state_reshuffle;
		}
		frame ++;
		wait_timer ++;
		break;
		
	case global.state_reshuffle:
		if (wait_timer > 60) {
			global.state = global.state_deal;
			wait_timer = 0;
		}
		wait_timer ++;
		break;
		
	case global.state_rebuild:
		if (wait_timer % 5 == 0 && ds_list_size(global.discard_pile) > 0) {
			discard_current_y = discard_pile_y;
			c = global.discard_pile[|0];
			c.face_up = false;
			c.target_x = deck_x;
			c.target_y = deck_y;
			ds_list_delete(global.discard_pile, 0);
			ds_list_add(temp_list, c);
			audio_play_sound(snd_deal, 10, 0);
		} 
		if (ds_list_size(global.discard_pile) == 0) {
			card_types = ds_list_create();
			for (i = 0; i < num_cards; i++) {
				img_index = 0;
				if (i < num_cards / 3) img_index = ROCK;
				else if (i < num_cards / 3 * 2) img_index = PAPER;
				else img_index = SCISSOR;
				ds_list_add(card_types, img_index);
			}

			randomize();
			ds_list_shuffle(card_types);

			for (i = 0; i < num_cards; i++) {
				c = instance_create_layer(x, y, "Instances", obj_card);
				c.face_up = false;
				c.img_index = card_types[|i];
				ds_list_add(global.deck, c);
				global.deck[|i].target_y = deck_y + i * offset;
			}
			
			for (j = 0; j < ds_list_size(temp_list); j++) {
				instance_destroy(temp_list[|j]);
			}
			wait_timer = 0;
			global.state = global.state_reshuffle;
			ds_list_clear(temp_list);
		}
		wait_timer ++;
		break;
		
}