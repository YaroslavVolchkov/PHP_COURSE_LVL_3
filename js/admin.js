/* --------------------------- preview image at the admin panel ------------------------ */

var inputFile = document.getElementById("inputFile");
var previewContainer = document.getElementById("imagePreview");
var previewImage = previewContainer.querySelector(".imagePreview_image");
var previewDefaultText = previewContainer.querySelector(".imagePreview_defaultText");

inputFile.addEventListener("change", function () {
    var file = this.files[0];
    if (file) {
        var reader = new FileReader();

        previewDefaultText.style.display = "none";
        previewImage.style.display = "block";

        reader.addEventListener("load", function() {
            previewImage.setAttribute("src", this.result);
        });
        reader.readAsDataURL(file);
    } else {
        previewDefaultText.style.display = null;
        previewImage.style.display = null;
        previewImage.setAttribute("src", "");
    }
});

$('.btnDeleteBook').click(function(event) {
    var bookId = this.getAttribute('btn-id');
    $.ajax({
        method: "POST",
        url: "http://library.loc/admin/deleteBook",
        data: {"id": bookId},
        success: function () {
            alert(
                "Книга удалена!"
            );
        }
    });
});
