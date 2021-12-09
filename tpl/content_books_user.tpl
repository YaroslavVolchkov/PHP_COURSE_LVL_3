<div class="container">
    <div id="content" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <?php foreach ($data['books'] as $bookData): ?>
        <div data-book-id="<?php echo $bookData['id'];?>" class="book_item col-xs-6 col-sm-3 col-md-2 col-lg-2">
            <div class="book">
                <a href="<?php echo URI_NAME?>/book/<?php echo $bookData['id'];?>"><img src="<?php echo URI_NAME?>/images/<?php echo $bookData['id'];?>.jpg" alt="<?php echo $bookData['title'];?>">
                    <div data-title="<?php echo $bookData['title'];?>" class="blockI" style="height: 46px;">
                        <div data-book-title="<?php echo $bookData['title'];?>" class="title size_text"><?php echo $bookData['title'];?></div>
                        <div data-book-author="<?php echo $bookData['author'];?>" class="author"><?php echo $bookData['author'];?></div>
                    </div>
                </a>
                <a href="<?php echo URI_NAME?>/book/<?php echo $bookData['id'];?>">
                    <button type="button" class="details btn btn-success">Читать</button>
                </a>
            </div>
        </div>
        <?php endforeach;?>
    </div>
</div>

<div class="container">
  <ul class="pagination justify-content-center">

      <?php echo $data['pagination']?>

  </ul>
</div>
