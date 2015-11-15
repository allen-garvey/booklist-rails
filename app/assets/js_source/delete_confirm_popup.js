/*
 * Create confirm dialog box for delete and perform action on confirm
 */
(function(){
    var confirm_links = document.querySelectorAll('a[data-confirm]');
    BL.each(confirm_links, function(item){
    	item.onclick = function(event){
	    	event.preventDefault();
	    	var message = this.getAttribute('data-confirm');
	    	var method = this.getAttribute('data-method');
	    	var url = this.href;
	    	var shouldDelete = window.confirm(message);
	    	if(shouldDelete){
	    		BL.ajax({type : method, url : url}, function(){
	    			window.location = url;
	    		});
	    	}
	    };
    });
})();