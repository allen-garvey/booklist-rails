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

//gets closest parent that matches selector
BL.closest = function(el, tag) {
  // this is necessary since nodeName is always in upper case
  tag = tag.toUpperCase();
  do {
    if (el.nodeName === tag) {
      return el;
    }
  } while (el = el.parentNode);

  return null;
};

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