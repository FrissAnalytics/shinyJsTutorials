var binding = new Shiny.InputBinding();

$.extend(binding, {

  find: function(scope) {
    return $(scope).find(".friss_btn_group");
  },

  getValue: function(el) {

      var set   = $(el).find(".active");

      var value = $.map(set, function(item){ return $(item).data("value")} );

      return value;
  },

  subscribe: function(el, callback) {

    $(el).on("click button", function(e) {

      $(e.target).toggleClass("active");

      callback();

    });
  },

  unsubscribe: function(el) {
    $(el).off(".friss_btn_group");
  }

});

Shiny.inputBindings.register(binding);
