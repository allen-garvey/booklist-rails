/*
 * Create confirm dialog box for delete and perform action on confirm
 */
(function(){
    var delete_forms = document.querySelectorAll('form[data-confirm]');
    BL.each(delete_forms, function(item){
    	item.onsubmit = function(event){
	    	event.preventDefault();
	    	var message = this.getAttribute('data-confirm');
	    	var callingForm = this;
	    	BL.modal.confirm(function(){
	    		callingForm.submit();
	    	}, {
	    		modal_text: message
	    	});
	    };
    });
})();