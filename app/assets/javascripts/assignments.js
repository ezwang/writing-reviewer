//= require selectize.min.js
//= require jquery-ui.min.js

$(document).on("turbolinks:load", function() {
    $("#assignment_due_date, #assignment_review_date").flatpickr({
        enableTime: true,
        dateFormat: 'Y-m-d H:i:S',
        allowInput: true
    });
    function addStudentToGroup(item, group) {
        group = group || 0;
        var ele = $("<div />");
        ele.text(item);
        ele.addClass("group-item");
        ele.attr("data-id", item);
        $("#groups").find(".group[data-id='" + group + "']").first().find(".group-items").append(ele);
    }
    var selectize = $("#students").selectize({
        valueField: 'email',
        labelField: 'email',
        searchField: 'email',
        options: [],
        create: false,
        load: function(query, callback) {
            if (!query.length) return;
            $.get("/users?q=" + encodeURIComponent(query), function(data) {
                callback(data.map(function(x) { return {"email": x}; }));
            });
        },
        onItemAdd: function(item) {
            addStudentToGroup(item, this.options[item].group);
        },
        onDelete: function(item) {
            $.each(item, function(k, v) {
                $("#groups .group-item[data-id='" + v + "']").remove();
            });
        },
        onInitialize: function() {
            var raw = this.$input.val().split(",");
            this.clear();
            this.clearOptions();
            for (var i = 0; i < raw.length; i += 2) {
                if (raw[i]) {
                    this.addOption({
                        email: raw[i],
                        group: raw[i + 1]
                    });
                    this.addItem(raw[i]);
                }
            }
        }
    });
    $("#groups .group-items").sortable({
        connectWith: ".group-items"
    }).disableSelection();
    $("#groups").closest("form").on("submit", function(e) {
        var out = [];
        $("#groups .group-items").each(function() {
            var gid = parseInt($(this).closest(".group").attr("data-id"));
            $(this).children().each(function() {
                out.push([$(this).attr("data-id"), gid]);
            });
        });
        $("input[name='groups']").val(JSON.stringify(out));
    });
});
