Dropzone.options.myDropzone = {
    acceptedFiles: "image/*",
    maxFilesize: 5,
    init: function () {
        this.on("complete", function () {
            location.reload();
        });
    }
};

if (document.querySelector('#myTable')) {
    new DataTable('#myTable');
}