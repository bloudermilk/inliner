(function() {

  $(function() {
    return $("body").crawl();
  });

  $.fn.crawl = function(parentComputed) {
    return $(this).each(function() {
      var attribute, computed, difference, parentValue, value, _i, _len;
      computed = getComputedStyle(this);
      difference = {};
      for (_i = 0, _len = computed.length; _i < _len; _i++) {
        attribute = computed[_i];
        value = computed.getPropertyValue(attribute);
        parentValue = parentComputed && parentComputed.getPropertyValue(attribute);
        if (value !== parentValue) difference[attribute] = value;
      }
      console.log(this, difference);
      $(this).css(difference);
      return $(this).children().crawl(computed);
    });
  };

}).call(this);
