<div class="container">
    <div id="content" class="book_block col-xs-12 col-sm-12 col-md-12 col-lg-12">

        <div id="id" book-id="<?php echo $data['bookData']['id'];?>">
            <div id="bookImg" class="col-xs-12 col-sm-3 col-md-3 item" style="margin:;"><img src="<?php echo URI_NAME ?>/images/<?php echo $data['bookData']['id'];?>.jpg" alt="Responsive image" class="img-responsive">

            </div>
            <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 info">
                <div class="bookInfo col-md-12">
                    <div id="title" class="titleBook"><?php echo $data['bookData']['title'];?></div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="bookLastInfo">
                        <div class="bookRow"><span class="properties">автор:</span><span id="author"><?php echo $data['bookData']['author'];?></span></div>
                        <div class="bookRow"><span class="properties">год:</span><span id="year"><?php echo $data['bookData']['year'];?></span></div>
                        <div class="bookRow"><span class="properties">страниц:</span><span id="pages"><?php echo $data['bookData']['numPages'];?></span></div>
                    </div>
                </div>
                <div class="btnBlock col-xs-12 col-sm-12 col-md-12">
                    <button type="button" class="btnBookID btn-lg btn btn-success" data-toggle="modal" data-target="#successModal">Хочу читать!</button>
                </div>
                <div class="bookDescription col-xs-12 col-sm-12 col-md-12 hidden-xs hidden-sm">
                    <h4>О книге</h4>
                    <hr>
                    <p id="description"><?php echo $data['bookData']['about'];?></p>
                </div>
            </div>
            <div class="bookDescription col-xs-12 col-sm-12 col-md-12 hidden-md hidden-lg">
                <h4>О книге</h4>
                <hr>
                <p class="description"><?php echo $data['bookData']['about'];?></p>
            </div>
            <div class="container">
                <div class="bookRow"><span class="properties">Посмотрели:</span><span id="author"><?php echo $data['bookData']['viewsBook']?> раз</span></div>
                <div class="bookRow"><span class="properties">Захотели:</span><span id="author"><?php echo $data['bookData']['requestsBook']?> раз</span></div>
            </div>
        </div>

        <div class="modal" id="successModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <img src="<?php echo URI_NAME ?>/images/checked.png" style="width: 60px" alt="Ok!">
                            <h3 class="modal-title">Отлично!</h3>
                            <p>Книга свободна и ты можешь прийти за ней.
                                Наш адрес: г. Кропивницкий, переулок Васильевский 10, 5 этаж.
                                Лучше предварительно прозвонить и предупредить нас, чтоб
                                не попасть в неловкую ситуацию. Тел. 099 196 24 69
                            </p>
                            <button class="btn btn-info" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="<?php echo URI_NAME?>/js/book.js" defer=""></script>
    </div>
</div>