//from http://www.isotope11.com/blog/make-a-snappable-cart-directive-with-angularjs
angular.module('sticky', []).directive('sticky', function($window) {
  return {
    restrict: 'E',
    transclude: true,
    //template includes a placeholder div so that content under transcluded div doesn't jump up when we set position: "fixed"
    template: '<div>\
               <div ng-transclude></div>\
               </div>',
    replace: true,
      link: function(scope, el, attrs) {
      var window = angular.element($window),
          placeholderElem = angular.element(el[0].children[0]),
          moveableElem = angular.element(placeholderElem[0].children[0]),
          parent = angular.element(el.parent()),
          currentOffsetTop = el.offset().top,
          origCss = {
            position: "static",
            width: getParentWidth()
          };

      placeholderElem.css({
            height: moveableElem.height()
       });

      handleSnapping();

      window.bind('scroll', function() {
        handleSnapping();
      });

      window.bind('resize', function() {
        moveableElem.css({
          width: getParentWidth()
        });
        placeholderElem.css({
            height: moveableElem.height()
        });

      });

      function returnDigit(val) {
        var re = /\d+/;
        var digit = val.match(re)[0];
        return digit;
      }

      function getParentWidth() {
        return returnDigit(parent.css('width')) - returnDigit(parent.css('padding-left')) - returnDigit(parent.css('padding-right'));
      }

      function getParentHeight() {
        return returnDigit(parent.css('height')) - returnDigit(parent.css('padding-top')) - returnDigit(parent.css('padding-bottom'));
      }

      function handleSnapping() {
        if (window.scrollTop() > currentOffsetTop) {
          var headerOffsetTop = -5;
          moveableElem.css({
            position: "fixed",
            top: headerOffsetTop + "px",
            width: getParentWidth()
          });
        } else {
          moveableElem.css(origCss);
          moveableElem.css({width: getParentWidth(),
                  'z-index': 100000});
        }
      }
    }
  };
});