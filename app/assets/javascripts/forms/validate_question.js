var forms = forms || {};

forms.validate_question = (function() {
  return {
    init: function() {
      var $form = $('#form-question');

      if ( $form.length ) {
        $form.bootstrapValidator({
          framework: 'bootstrap',
          icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
          },
          fields: {
            'question[content]': {
              validators: {
                notEmpty: {
                  message: 'The question content is required'
                }
              }
            },
            'question[answer]': {
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
