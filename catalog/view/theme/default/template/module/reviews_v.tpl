<style type="text/css">
    .review {
        border-bottom: 1px #eee solid;
    }

    .reviews-btn {
        float: right !important;
    }

    .reviews-caption {
        min-height: 0 !important;
    }

    .reviews-description {
        font-family: Georgia, Times, "Times New Roman", serif;
        font-style: italic;
    }

    .reviews-sign {
        text-align: right;
    }

    .reviews-author {
        font-weight: bold;
        text-align: right;
    }

    .reviews-date {
        text-align: right;
    }
</style>

<?php if ($module_header) { ?>
<h3><?php echo $module_header; ?></h3>
<?php }?>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="product-thumb transition">
            <?php foreach ($reviews as $review) { ?>
            <div class="review">
                <div class="image"><a href="<?php echo $review['prod_href']; ?>"><img src="<?php echo $review['prod_thumb']; ?>" alt="<?php echo $review['prod_name']; ?>" title="<?php echo $review['prod_name']; ?>" class="img-responsive" /></a></div>
                <div class="caption reviews-caption">
                    <h4><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></h4>
                    <p class="reviews-description"><?php echo $review['description']; ?></p>
                    <?php if ($review['rating']) { ?>
                    <div class="rating">
                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($review['rating'] < $i) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } ?>
                        <?php } ?>
                    </div>
                    <?php } ?>
                    <div class="reviews-sign">
                        <div class="reviews-author"><?php echo $review['author']; ?></div>
                        <div class="reviews-date"><?php echo $review['date_added']; ?></div>
                    </div>
                </div>
            </div>
            <?php } ?>
            <?php if ($show_all_button) { ?>
            <div class="button-group">
                <button type="button" class="reviews-btn" onclick="window.location.href='<?php echo $link_all_reviews; ?>'"><?php echo $text_all_reviews ?></button>
            </div>
            <?php } ?>
        </div>
    </div>
</div>
