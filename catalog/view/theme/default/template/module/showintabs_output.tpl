<div class="box products <?php echo $columns; ?> container">
<?php if (count($tabs) <= 1) { ?>
   <div class="box-heading">
    <?php foreach ($tabs as $keyTab => $tab) { ?>
	<?php echo $tab['title']; ?>
	</div>
    <?php } ?>
    <?php } else { ?>
    <div class="box-heading product-tabs">
    <ul id="tabs-<?php echo $module; ?>" class="nav nav-tabs" data-tabs="tabs">
		<?php foreach ($tabs as $keyTab => $tab) { ?>
           	<?php if($keyTab == 0) { ?>
            <li class="active"><a href="#tab<?php echo $module; ?><?php echo $keyTab; ?>" data-toggle="tab"><span><?php echo $tab['title']; ?></span></a></li>
            <?php } else { ?>
            <li><a href="#tab<?php echo $module; ?><?php echo $keyTab; ?>" data-toggle="tab"><span><?php echo $tab['title']; ?></span></a></li>
            <?php } ?>
    	<?php } ?>
	</ul>
    </div>
<?php } ?>
<div class="tab-content">
    <?php foreach ($tabs as $key => $tab) { ?>
    <div class="tab-pane <?php echo (empty($key) ? 'active' : ''); ?>" id="tab<?php echo $module; ?><?php echo $key; ?>">
    <div class="grid_holder">
    <div class="product-grid <?php echo $module; ?> <?php if ($carousel) { ?>carousel<?php } ?>">
        <?php foreach ($tab['products'] as $product) { ?><!--
        --><div class="item contrast_font col-md-3 col-xs-12 seller">
            <?php if ($product['thumb']) { ?>
				  <div class="image">
              <?php if ($product['special'] && $cosyone_percentage_sale_badge == 'enabled') { ?>
            <div class="sale_badge">-<?php echo $product['sales_percantage']; ?>%</div>
            <?php } ?>
              <?php if ($product['thumb_hover'] && $cosyone_rollover_effect == 'enabled') { ?>
              <div class="image_hover"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb_hover']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
              <?php } elseif ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
            <?php } ?>
                        <?php if($product['labels']) { ?>
      <?php foreach ($product['labels'] as $label) { ?>
            <div class="<?php echo $label['position']; ?>"><img src="<?php echo HTTP_SERVER.'image/'.$label['image']; ?>"></div>
      <?php } ?>
      <?php } ?>
                <?php if ($cosyone_text_ql) {?>
                <div class="main_quicklook">
                <a href="<?php echo $product['quickview']; ?>" rel="nofollow" class="button quickview"><i class="fa fa-eye"></i> <?php echo $cosyone_text_ql; ?></a>
                </div>
                <?php } ?>
            </div>
                <!-- IMAGE ENDS-->
<!-- <div class="image">
      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
      <?php if($product['labels']) { ?>
      <?php foreach ($product['labels'] as $label) { ?>
            <div class="<?php echo $label['position']; ?>"><img src="<?php echo HTTP_SERVER.'image/'.$label['image']; ?>"></div>
      <?php } ?>
      <?php } ?>
</div>
 -->















				<?php } ?>
                <div class="hidden_hover">
                    <div class="hidden_content">
                         <span class="sku"><?php echo $product['sku']; ?></span>


                <div class="attributes">
       <!-- начинаем вывод атрибутов -->
       <?php if($product['attribute_groups']) { ?>
                <?php foreach($product['attribute_groups'] as $attribute_group) { ?>
                    <?php if(!strpos($attribute_group['name'], "—")) { ?>
                        <?php foreach($attribute_group['attribute'] as $attribute) { ?>
                        <!--если нам надо определенный атрибут-->
                             <?php if(in_array($attribute['attribute_id'], array(18,4))){ ?>
                               <b><?php echo $attribute['name']; ?></b> <?php echo $attribute['text']; ?><br>
                             <?php } ?>
                        <!--если нам надо определенный атрибут-->
                        <?php } ?>
                    <?php } ?>
                <?php } ?>
            <?php } ?>
 <!-- конец атрибутов-->
    </div>


                <div class="cart"><button type="submit" class="button contrast" onclick="cart.add('<?php echo $product['product_id']; ?>');" ><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button></div>
                <!--<div class="icons_wrapper">
    <a class="sq_icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
    <a class="sq_icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a>
    <?php if ($cosyone_text_ql) { ?>
    <a href="<?php echo $product['quickview']; ?>" rel="nofollow" class="sq_icon qlook quickview" data-tooltip="<?php echo $cosyone_text_ql; ?>"><i class="fa fa-eye"></i></a>
    <?php } ?>
    <a class="sq_icon contrast add_to_cart" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a>
    <a class="plain_link wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
    <a class="plain_link compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
    </div>-->
        </div>
            </div>
                <div class="information_wrapper">
                <div class="left">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                <?php if ($product['brand_name'] && $cosyone_brand) { ?>
                <span class="brand main_font"><?php echo $product['brand_name']; ?></span>
                <?php } ?>
                <?php if ($product['rating']) { ?>
      			<div class="rating"><span class="rating r<?php echo $product['rating']; ?>"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span></div>
      			<?php } ?>
				</div><!-- left wrapper ends -->
                   <?php if ($product['price']) { ?>
					   <div class="price">
					   <?php if (!$product['special']) { ?>
					   <?php echo $product['price']; ?>
					   <?php } else { ?>
					   <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
					   <?php } ?>
					   </div>
					   <?php } ?>
 <div class="cart mobile"><button type="submit" class="button contrast" onclick="cart.add('<?php echo $product['product_id']; ?>');" ><!-- <i class="fa fa-shopping-cart"></i> --> <?php echo $button_cart; ?></button></div>
        </div><!-- informtion wrapper ends -->
        </div><!--

        --><?php } ?>

    </div>
    </div>
    </div>
    <?php } ?>
</div>
</div>

<?php if ($carousel) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
var grid5 = 5;
var grid4 = 4;
var grid3 = 3;
var grid1 = 1;
$('.product-grid.<?php echo $module; ?>').owlCarousel({
itemsCustom: [ [0, 1], [350, 2], [550, 3], [1025, <?php echo $columns; ?>]],
pagination: false,
navigation:true,
slideSpeed:500,
scrollPerPage:false,
navigationText: [
"<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
"<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"
]
});
});
//--></script>
<?php } ?>