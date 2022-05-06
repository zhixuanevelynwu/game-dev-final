/// @description Insert description here
// You can write your code in this editor
switch (global.state) {
	case global.state_deal:
		deal_cards();
		break;

	case global.state_input:
		play_cards();
		break;
		
	case global.state_takeback:
		take_back();
		break;
	
	case global.state_compare:
		if (wait_timer == 60) {
			decide_winner(player_selected_card.img_index, ai_selected_card.img_index);
		} else {
			discard_cards();
		}
		
		if (ds_list_size(global.hand0) == 0 && ds_list_size(global.hand1) == 0) {
			wait_timer = 0;
			global.state = global.state_reshuffle;
		}
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
			replace_card();
		} 
		if (ds_list_size(global.discard_pile) == 0) {
			create_deck(num_cards);
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
