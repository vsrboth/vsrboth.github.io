BiSalon.Cookie = {
  set: function(name, value, days, domain, path) {
    var expires = '';

    if (days) {
      var d = new Date();
      d.setTime(d.getTime() + (days*24*60*60*1000));
      expires = '; expires=' + d.toGMTString();
    }

    domain = domain ? '; domain=' + domain : '';
    path = '; path=' + (path ? path : '/');
    document.cookie = name + '=' + value + expires + path + domain;
  },

  read: function(name) {
    var n = name + '=';
    var cookies = document.cookie.split(';');

    for (var i = 0; i < cookies.length; i++) {
      var c = cookies[i].replace(/^\s+/, '');

      if (c.indexOf(n) == 0) {
        return c.substring(n.length);
      }
    }

    return null;
  },

  destroy: function(name, domain, path) {
    this.set(name, '', -1, domain, path);
  }
};
