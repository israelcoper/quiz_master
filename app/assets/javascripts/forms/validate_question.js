var forms = forms || {};

forms.validate_question = (function() {
  return {
    init: function() {
      var $form = $('#form-question');

      if ( $form.length ) {
        $form.bootstrapValidator({
          framework: 'bootstrap',
          excluded: [':disabled'],
          fields: {
            'question[content]': {
              validators: {
                callback: {
                  message: 'The question content must be atleast 10 characters long',
                  callback: function(value,validator,$field) {
                    // Get the plain text without HTML
                    var text = tinyMCE.activeEditor.getContent({ format: 'text' });
                    return text.length >= 10;
                  } 
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
