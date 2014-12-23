(function($){
  $(document).ready(function() {

  // Add out the outgoingpayments model
  window.Exercise = Backbone.Model.extend({
  });

  ExerciseList = Backbone.Collection.extend({
    model: Exercise,
    localStorage: new Store("exercises"),
  });

  window.Exercises = new ExerciseList();

  // For individual payments
  window.ExerciseView = Backbone.View.extend({
//    template: _.template($('#payment-template').html()),
    
    events : {
    },

    initialize: function() {
      _.bindAll(this, 'render');
      this.model.bind('change', this.render);
    },

    render: function() {
      $(this.el).html(this.template(this.model.toJSON()));
      return this;
    }, 

    destroy: function(e) {
      this.model.destroy();  
      $(this.el).remove(); 
    }
  });

  }); // End document ready

})(jQuery);
