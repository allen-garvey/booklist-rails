BL.modal = {};

(function(){

	BL.modal.hide = function(){
		document.getElementById('modal_container').style.display = 'none';
	};

	BL.modal.show = function(){
		document.getElementById('modal_container').style.display = '';
	};

	BL.modal.confirm = function(confirmFunc, options){
		var modal = document.getElementById('modal');
		modal.classList.remove('alert');
		modal.classList.add('confirm');
		options = options || {};
		document.getElementById('modal_body').innerHTML = options.modal_text || "";
		var confirm_button = document.getElementById('modal_confirm_confirm');
		confirm_button.innerHTML = options.confirm_button_text || 'Delete';
		var cancel_button = document.getElementById('modal_confirm_cancel');
		cancel_button.innerHTML = options.cancel_button_text || 'Cancel';
		cancel_button.onclick = BL.modal.hide;
		confirm_button.onclick = confirmFunc;
		BL.modal.show();
	};

	BL.modal.alert = function(options){
		var modal = document.getElementById('modal');
		modal.classList.remove('confirm');
		modal.classList.add('alert');
		options = options || {};
		document.getElementById('modal_body').innerHTML = options.modal_text || "";
		var confirm_button = document.getElementById('modal_alert_confirm');
		confirm_button.innerHTML = options.confirm_button_text || 'Ok';
		confirm_button.onclick = BL.modal.hide;
		BL.modal.show();
	};

	document.getElementById('modal_overlay').onclick = BL.modal.hide;
    
})();
