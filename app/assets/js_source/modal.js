BL.modal = {};

(function(){

	BL.modal.hide = function(){
		document.getElementById('modal_container').style.display = 'none';
	};

	BL.modal.show = function(confirmFunc, options){
		options = options || {};
		document.getElementById('modal_body').innerHTML = options.modal_text || "";
		var confirm_button = document.getElementById('modal_alert_confirm');
		confirm_button.innerHTML = options.confirm_button_text || 'Delete';
		var cancel_button = document.getElementById('modal_alert_cancel');
		cancel_button.innerHTML = options.cancel_button_text || 'Cancel';
		cancel_button.onclick = BL.modal.hide;
		confirm_button.onclick = confirmFunc;
		document.getElementById('modal_container').style.display = '';
	};

	document.getElementById('modal_overlay').onclick = BL.modal.hide;
    
})();
