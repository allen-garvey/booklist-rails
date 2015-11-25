/*
 * Global utility functions for app
 * 
 */

var BL = BL || {};

//foreach for arrays and array-like objects
BL.each = function(list, func){
	var len = list.length;
	for (var i = 0; i < len; i++) {
		func.call(list[i], list[i], i);
	};
};

//http://stackoverflow.com/questions/22100853/dom-pure-javascript-solution-to-jquery-closest-implementation
BL.closest = function closest(el, fn) {
    return el && (
        fn(el) ? el : closest(el.parentNode, fn)
    );
}



/*
 * similar to jquery ajax
 * options = {
    type: 'POST',
    url: '/my/url',
    data: data
  }
 */
BL.ajax = function(options, success, error){
  var request = new XMLHttpRequest();
  options = options || {};
  success = success || function(){};
  error = error || function(){};
  var data = options.data || null;
  var method = options.type || 'GET';
  request.open(method, options.url, true);

  request.onload = function() {
    if (request.status >= 200 && request.status < 400) {
      // Success!
      success(request);
    } else {
      error();
    }
  };

  request.onerror = error;

  request.send(data);
};