BL.modal = {};

BL.modal.hide = function(){
	document.getElementById('modal_container').style.display = 'none';
};

BL.modal.show = function(confirmFunc, options){
	options = options || {};
	document.getElementById('modal_body').innerHTML = options.modal_text || "";
	var confirm_button = document.getElementById('modal_confirm');
	confirm_button.innerHTML = options.confirm_button_text || 'Delete';
	document.getElementById('modal_cancel').innerHTML = options.cancel_button_text || 'Cancel';
	document.getElementById('modal_container').style.display = '';
	confirm_button.onclick = confirmFunc;
};

document.getElementById('modal_cancel').onclick = BL.modal.hide;
document.getElementById('modal_overlay').onclick = BL.modal.hide;