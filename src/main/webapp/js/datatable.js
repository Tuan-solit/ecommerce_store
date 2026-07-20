$(document).ready(function () {

    $(".datatable").DataTable({

        dom: "lrtip",

        pageLength: 10,

        lengthChange: false,

        ordering: false,

        searching: true,

        info: true,

        language: {
            url: "https://cdn.datatables.net/plug-ins/1.13.8/i18n/vi.json"
        }

    });

});