// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function compute_decision(){
	with (obj_game_manager) {
		available_options = [ai_selected_card0, ai_selected_card1];
		
		// when the option is obvious, make decision base on the only card player played
		if (selected_card0.img_index == selected_card1.img_index) {
			sel = selected_card0.img_index;
			winning_option = sel == global.SCISSOR ? 1 : sel + 1;
			// do we have a card that beats the player?
			for (i = 0; i < array_length(available_options); i ++) {
				if (available_options[i].img_index == winning_option) {
					return i;
				}
			}
			// if not, go for a tie
			for (i = 0; i < array_length(available_options); i ++) {
				if (available_options[i].img_index == sel) {
					return i;
				}
			}
			// still none -> play a random card
			return irandom_range(0, 1);
		} else {
			// TODO: decide whether to use the special based on score
			return irandom_range(0, 1);
		}
	}
}