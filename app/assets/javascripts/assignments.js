$(document).on("turbolinks:load", function() {
    $("#assignment_due_date, #assignment_review_date").flatpickr({
        enableTime: true,
        dateFormat: 'Y-m-d H:i:S',
        allowInput: true
    });
});
