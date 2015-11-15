/*
 * Filtering for index page
 */
(function(){
    var index_list_links = document.querySelectorAll('#index_list .js_item_link');
    if(index_list_links.length < 1){
    	return;
    }
    var index_list = document.getElementById('index_list');
    var index_list_items = document.querySelectorAll('#index_list > li');
    document.getElementById('index_search').onkeyup = function(){
    	var search_text = this.value;
    	var search_regex = new RegExp(search_text, 'i');
    	var listFrag = document.createDocumentFragment();
    	BL.each(index_list_links, function(item, i){
    		var parent_li = BL.closest(this, 'li');
    		if(search_regex.test(this.text)){
    			listFrag.appendChild(parent_li);
    		}
    	});
    	index_list.innerHTML = '';
    	index_list.appendChild(listFrag);
    };
})();