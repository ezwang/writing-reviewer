//= require selectize.min.js

$(document).on("turbolinks:load", function() {
    $("#assignment_due_date, #assignment_review_date").flatpickr({
        enableTime: true,
        dateFormat: 'Y-m-d H:i:S',
        allowInput: true
    });
    var selectize = $("#students").selectize({
        valueField: 'email',
        labelField: 'email',
        searchField: 'email',
        options: [],
        create: false,
        load: function(query, callback) {
            if (!query.length) return;
            $.get("/users", function(data) {
                callback(data.map(function(x) { return {"email": x}; }));
            });
        }
    });
});
