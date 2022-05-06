// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function compute_decision(){
	with (obj_game_manager) {
		ai_cards = [ai_selected_card0.img_index, ai_selected_card1.img_index];
		pl_cards = [selected_card0.img_index, selected_card1.img_index];
		
		// when the option is obvious, make decision base on the only card player played
		if (pl_cards[0] == pl_cards[1]) {
			sel = pl_cards[0];
			winning_option = sel == 3 ? 1 : sel + 1;
			// do we have a card that beats the player?
			for (i = 0; i < array_length(ai_cards); i ++) {
				if (ai_cards[i] == winning_option) {
					return i;
				}
			}
			// if not, go for a tie
			for (i = 0; i < array_length(ai_cards); i ++) {
				if (ai_cards[i] == sel) {
					return i;
				}
			}
			// still none -> play a random card
			return irandom_range(0, 1);
		} else if (min(ai_cards[0], ai_cards[1]) == min(pl_cards[0], pl_cards[1]) &&
					max(ai_cards[0], ai_cards[1]) == max(pl_cards[0], pl_cards[1])) {
			// when both sides play same cards, select one that beats the other
			return compare_cards(ai_cards[0], ai_cards[1]);
		}
		
		
		else {
			// TODO: decide whether to use the special based on score
			return irandom_range(0, 1);
		}
	}
}