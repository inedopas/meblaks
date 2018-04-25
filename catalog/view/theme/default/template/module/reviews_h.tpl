
</div><div class="container">
<div class="row reviews">
<?php if ($module_header) { ?>
<h3 class="what_text"><?php echo $module_header; ?></h3>
<?php }?>
    <?php foreach ($reviews as $review) { ?>
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $review['prod_href']; ?>"><img src="<?php echo $review['prod_thumb']; ?>" alt="<?php echo $review['prod_name']; ?>" title="<?php echo $review['prod_name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
                <h4 class="h3"><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></h4>
                <p><?php echo $review['description']; ?></p>
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
                <p class="price">
                    <?php echo $review['author']; ?>
                    <span class="price-tax"><br><?php echo $review['date_added']; ?></span>
                </p>
            </div>
        </div>
    </div>
    <?php } ?>
</div>
<?php if ($show_all_button) { ?>
<div class="row text-right">
    <a class="choise" href="<?php echo $link_all_reviews; ?>" style="    margin: 0px 15px;" ><?php echo $text_all_reviews ?></a>
</div>
<?php } ?>
