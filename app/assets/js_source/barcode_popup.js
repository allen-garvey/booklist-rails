/*
 * Functionality to show barcode of booklist on location book list
 * 
 */

BL.barcode = {};
BL.barcode.REGENERATION_DELAY_TIME = 2000;

BL.barcode.show = function(){
	var book_list = BL.closest(this, function(el){return el.className === 'show_subcategory'}).querySelector('.show_subcategory_list');
	var book_list_html = '<ul class="qr_code_list" id="qr_code_list">';
	var book_list_string = '';
	BL.each(book_list.children, function(){
		var title_link = this.querySelector('.js_book_title');
		var title = title_link ? title_link.innerHTML : '';
		var call_num = this.querySelector('.super_search_link');
		var call_num_string = call_num ? call_num.innerHTML : '';
		var qr_code_string = title + ' ' + call_num_string + '\n';
		book_list_html = book_list_html + '<li data-qr-string="' + qr_code_string + '"><a onclick="BL.barcode.removeListItem(this);">[x]</a> ' + title + ' ' + call_num_string + '</li>';
		book_list_string = book_list_string + qr_code_string;
	});
	book_list_html = book_list_html + "</ul><div id='qr_code'></div>";
	BL.modal.alert({modal_text : book_list_html});
	BL.barcode.generate(book_list_string);
};

BL.barcode.generate = function(code_content){
	new QRCode(document.getElementById("qr_code"), {
		text : code_content,
		width : 500,
		height : 500
	});
};

BL.barcode.getBarcodeString = function(){
	var barcodeString = '';
	var barcode_list = document.getElementById('qr_code_list');
	BL.each(barcode_list.children, function(){
		barcodeString = barcodeString + this.getAttribute('data-qr-string');
	});

	return barcodeString;

};

BL.barcode.removeListItem = function(caller){
	var parent_li = BL.closest(caller, function(el){
		return el.tagName.toLowerCase() === 'li';
	});
	parent_li.parentNode.removeChild(parent_li);
	
	//use timeout and clear timeout so qr code regeneration is batched for multiple deletions
	if(BL.barcode.updateQrCodeTimeout){
		window.clearTimeout(BL.barcode.updateQrCodeTimeout);
	}

	BL.barcode.updateQrCodeTimeout = window.setTimeout(function(){
		document.getElementById('qr_code').innerHTML = '';
		BL.barcode.generate(BL.barcode.getBarcodeString());
	},BL.barcode.REGENERATION_DELAY_TIME);
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
