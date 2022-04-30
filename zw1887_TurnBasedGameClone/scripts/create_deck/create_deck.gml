// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_deck(num_cards){
	card_types = ds_list_create();
	for (i = 0; i < num_cards; i++) {
		img_index = 0;
		if (i < num_cards / 3) img_index = global.ROCK;
		else if (i < num_cards / 3 * 2) img_index = global.PAPER;
		else img_index = global.SCISSOR;
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
	
	return card_types;
}