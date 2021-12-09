<div class="container-fluid d-flex justify-content-between" style="margin-top: 10px">
    <div class="col-7">
        <table class="tableBooks table table-borderless table-hover">
            <thead>
                <tr style="background-color: rgba(134,146,39,0.08);">
                    <th scope="col">Ссылка</th>
                    <th scope="col">Название книги</th>
                    <th scope="col">Авторы</th>
                    <th scope="col">Год</th>
                    <th scope="col">Действие</th>
                    <th scope="col">Кликов</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($data['books'] as $book): ?>
                    <tr>
                        <td class="align-baseline"><img src="<?php echo URI_NAME ?>/images/<?php echo $book['id']?>.jpg" alt="bookImage" style="width: 30px"></td>
                        <th scope="row" class="align-baseline"><?php echo $book['title']?></th>
                        <td class="align-baseline"><?php echo $book['author']?></td>
                        <td class="align-baseline"><?php echo $book['year']?></td>
                        <td class="align-baseline"><button type="button" btn-id="<?php echo $book['id']?>" class="btnDeleteBook btn btn-sm btn-link" style="color: red;">Удалить</button></td>
                        <td class="align-baseline"><?php echo $book['viewsBook']?></td>
                    </tr>
                <?php endforeach;?>
            </tbody>
        </table>
        <div class="row d-flex justify-content-center">
            <?php echo $data['pagination']?>
        </div>
    </div>

    <div class="containerFormAddBook col-5">
        <form class="formAddBook container-fluid" method="POST" enctype="multipart/form-data" action="addBook">
            <h6 class="text-center" style="margin-top: 10px">Форма добавления книги</h6>
            <div class="form-row">
                <div class="form-group col-7">
                    <div class="form-group">
                        <input required class="form-control" type="text" name="title" placeholder="Название книги">
                    </div>
                    <div class="form-group">
                        <input required class="form-control" type="text" name="numPages" placeholder="Количество страниц">
                    </div>
                    <div class="form-group">
                        <input required class="form-control" type="text" name="year" placeholder="Год издания">
                    </div>
                    <div class="form-group custom-file">
                        <input required type="file" class="custom-file-input" id="inputFile" name="image">
                        <label class="custom-file-label" for="inputFile">Выберите изображение</label>
                    </div>
                    <div class="image-preview" id="imagePreview">
                        <img src="" alt="Image Preview" class="imagePreview_image">
                        <span class="imagePreview_defaultText text-center">Предпросмотр изображения</span>
                    </div>
                </div>
                <div class="form-group col-5">
                    <div class="form-group">
                        <input required class="form-control" type="text" name="author1" placeholder="Автор">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="author2" placeholder="Автор2">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="author3" placeholder="Автор3">
                    </div>
                    <div class="form-group">
                        <textarea required class="textAreaAdmin form-control" id="validationTextarea" name="about" placeholder="Описание книги"></textarea>
                    </div>
                </div>
            </div>
            <div class="formAddBookFooter">
                <button type="submit" class="btnAddBook btn btn-success">Добавить</button>
                <p class="formAddBookFooterText">*оставьте поля автор пустыми если авторов меньше 3</p>
            </div>
        </form>
    </div>
</div>
<script src="<?php echo URI_NAME?>/js/admin.js"></script>
