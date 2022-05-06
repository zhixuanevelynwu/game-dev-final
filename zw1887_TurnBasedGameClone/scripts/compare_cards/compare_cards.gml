// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function compare_cards(v0, v1){
		if (v0 != v1) {
			if (v0 == global.ROCK) {
				if (v1 == global.SCISSOR) {
					return 0;
				} else {
					return 1;
				}
			} else if (v0 == global.PAPER) {
				if (v1 == global.ROCK) {
					return 0;
				} else {
					return 1;
				}
			} else if (v0 == global.SCISSOR) {
				if (v1 == global.PAPER) {
					return 0;
				} else  {
					return 1;	
				}
			}
		} else {
			return 0;
		}
}