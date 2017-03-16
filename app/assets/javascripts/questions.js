$(document).on('turbolinks:load', function(e) {
  forms.validate_question.init();

  tinyMCE.init({
    selector: 'textarea',
    setup: function(editor) {
      editor.on('keyup', function(e) {
        $('#form-question').bootstrapValidator('revalidateField', 'question[content]');
      });
    }
  });
});
