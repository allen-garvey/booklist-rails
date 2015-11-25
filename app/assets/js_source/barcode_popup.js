/*
 * Functionality to show barcode of booklist on location book list
 * 
 */

BL.barcode = {};

BL.barcode.show = function(){
	var book_list = BL.closest(this, function(el){return el.className === 'show_subcategory'}).querySelector('.show_subcategory_list');
	var book_list_string = '';
	BL.each(book_list.children, function(){
		var title_link = this.querySelector('.js_book_title');
		var title = title_link ? title_link.innerHTML : '';
		var call_num = this.querySelector('.super_search_link');
		var call_num_string = call_num ? call_num.innerHTML : '';
		book_list_string = book_list_string + title + ' ' + call_num_string + '<br/>';
	});
	BL.modal.alert({modal_text : book_list_string});
};


(function(){
    var barcode_triggers = document.querySelectorAll('*[data-barcode-trigger]');
    if(barcode_triggers.length < 1){
    	return;
    }
    BL.each(barcode_triggers, function(){
    	this.onclick = BL.barcode.show;
    });

})();
