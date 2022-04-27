/// @description Insert description here
// You can write your code in this editor
if (!discarded) {
	if (global.state == global.state_input && dealt) {
		if (in_hand) {
			face_up = true;
			if (!displayed) {
				if (position_meeting(mouse_x, mouse_y, id)) {
					target_y = global.player_hand_y - dist_y;
					global.selected_card = id;
				} else {
					target_y = global.player_hand_y;
				}
			} 
		} else {
			if (!global.ai_turn) target_y = global.ai_hand_y;
		}
	}
	
	if (displayed && global.state == global.state_takeback) {
		if (position_meeting(mouse_x, mouse_y, id)) {
			target_y = global.player_hand_y - sprite_get_height(spr_card) - spacing  - dist_y;
			global.selected_card = id;
		} else {
			target_y = global.player_hand_y - sprite_get_height(spr_card) - spacing;
		}
	}
}

depth = - (room_height - target_y);