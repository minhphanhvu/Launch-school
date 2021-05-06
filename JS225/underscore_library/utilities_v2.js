(function() {

  var findObjs = function(element, props, multiple) {
    var match = multiple ? [] : undefined;

    element.some(function(obj) {
      let all_match = true;

      for (var prop in props) {
        if (!(prop in obj) || obj[prop] !== props[prop]) {
          all_match = false;
        }
      }

      if (all_match) {
        if (multiple) {
          match.push(obj);
        } else {
          match = obj;
          return true;
        }
      }
    })

    return match;
  }

  var _= function(element) {
    u = {
      first: function() {
        return element[0];
      },

      last: function() {
        return element[element.length - 1]
      },

      without: function() {
        let new_arr = [];
        let args = Array.prototype.slice.call(arguments)

        element.forEach(function(el) {
          if (args.indexOf(el) === -1) {
            new_arr.push(el);
          }
        })
        return new_arr;
      },

      lastIndexOf: function(el) {
        for (var i = element.length - 1; i >= 0; i--) {
          if (element[i] === el) {
            return i;
          }
        }

        return -1;
      },

      sample: function(quantity) {
        let sampled = [];
        let copy = element.slice();
        let get = function() {
          let idx = Math.floor(Math.random() * copy.length);
          let el = copy[idx];
          copy.splice(idx, 1);
          return el;
        };

        if (!quantity) {
          return get();
        }
        while (quantity) {
          sampled.push(get());
          quantity--;
        }

        return sampled;
      },

      findWhere: function(props) {
        return findObjs(element, props, false)
      },

      where: function(props) {
        return findObjs(element, props, true)
      },

      pluck: function(query) {
        var vals = [];

        element.forEach(function(obj) {
          if (obj[query]) {
            vals.push(obj[query])
          }
        })

        return vals;
      },

      keys: function() {
        return Object.keys(element)
      },

      values: function() {
        return Object.values(element)
      },

      pick: function() {
        var args = Array.prototype.slice.call(arguments),
          new_obj = {}

        args.forEach(function(prop) {
          if (prop in element) {
            new_obj[prop] = element[prop];
          }
        })

        return new_obj;
      },

      omit: function() {
        var args = Array.prototype.slice.call(arguments),
          new_obj = {};

        for (var prop in element) {
          if (args.indexOf(prop) === -1) {
            new_obj[prop] = element[prop];
          }
        }

        return new_obj;
      },

      has: function(prop) {
        return {}.hasOwnProperty.call(element, prop)
      },
    };

    (["isElement", "isArray", "isObject", "isFunction", "isBoolean", "isString", "isNumber"]).forEach(function(method) {
      u[method] = function() { _[method].call(u, element); };
    });

    return u;
  };

  _.range = function(start, stop) {
    var range = [];
    if (stop === undefined) {
      stop  = start;
      start = 0;
    }

    for (var i = start; i < stop; i++) {
      range.push(i);
    }

    return range;
  }

  _.extend = function() {
    var args = Array.prototype.slice.call(arguments),
        old_obj = args.pop(),
        new_obj = args[args.length - 1];

    for (var prop in old_obj) {
      new_obj[prop] = old_obj[prop];
    }

    return args.length === 1 ? new_obj : _.extend.apply(_, args)
  }

  _.isElement = function(obj) {
    return obj && obj.nodeType === 1;
  }

  _.isArray = function(obj) {
    return toString.call(obj) === "[object Array]";
  }

  _.isObject = function(obj) {
    var type = typeof obj;

    return type === 'function' || type === 'object' && !!obj
  }

  _.isFunction = function(obj) {
    var type = typeof obj;

    return type === 'function';
  }

  _.isBoolean = function(obj) {
    return toString.call(obj) === '[object Boolean]'
  }

  _.isString = function(obj) {
    return toString.call(obj) === '[object String]'
  }

  _.isNumber = function(obj) {
    return toString.call(obj) === '[object Number]'
  }

  window._ = _;
})();