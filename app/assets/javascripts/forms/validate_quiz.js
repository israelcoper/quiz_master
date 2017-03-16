var forms = forms || {};

forms.validate_quiz = (function() {
  return {
    init: function() {
      var $form = $('#form-quiz');

      if ( $form.length ) {
        $form.bootstrapValidator({
          framework: 'bootstrap',
          fields: {
            'quiz[answer]': {
              validators: {
                notEmpty: {
                  message: 'The answer is required'
                }
              }
            }
          }
        }).on('success.form.bv', function(e) {
        }).on('err.form.bv', function(e) {
        });
      }
    }
  }
}());
