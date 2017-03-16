var forms = forms || {};

forms.validate_signin = (function() {
  return {
    init: function() {
      var $form = $('#form-signin');
      var regex = new RegExp("(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[^a-zA-Z])");

      if ( $form.length ) {
        $form.bootstrapValidator({
          framework: 'bootstrap',
          fields: {
            'email': {
              validators: {
                notEmpty: {
                  message: 'The email is required'
                }
              }
            },
            'password': {
              validators: {
                notEmpty: {
                  message: 'The password is required'
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
