$('.btnBookID').click(function(event) {
    var bookId = $('#id').attr('book-id');
    $.ajax({
        method: "POST",
        url: "http://library.loc/book/incrementRequestsBook",
        data: {"id": bookId}
        // success: function () {
        //     alert(
        //         "Книга свободна и ты можешь прийти за ней." +
        //         " Наш адрес: г. Кропивницкий, переулок Васильевский 10, 5 этаж." +
        //         " Лучше предварительно прозвонить и предупредить нас, чтоб " +
        //         " не попасть в неловкую ситуацию. Тел. 099 196 24 69"+
        //         " \n\n"
        //     );
        // }
    });
});