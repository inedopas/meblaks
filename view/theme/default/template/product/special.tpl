<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> <?php echo $cosyone_grid_category; ?>">
    <?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="display"> 
    <a id="grid_view_icon"><i class="fa fa-th"></i></a><a id="list_view_icon"><i class="fa fa-list"></i></a>
    </div>
    <div class="limit mobile_hide"><?php echo $text_limit; ?>
      <select id="input-limit" onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><?php echo $text_sort; ?>
      <select id="input-sort" onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
              
    </div>
     <div class="compare-link mobile_hide"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
  </div>
  <div id="main" class="product-<?php echo $cosyone_default_view; ?>">
  <div class="grid_holder">
    <?php foreach ($products as $product) { ?><!--
    --><div class="ite1m contrast_font product-layout">
       <div class="image">
      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
      <?php if($product['labels']) { ?>
      <?php foreach ($product['labels'] as $label) { ?>
            <div class="<?php echo $label['position']; ?>"><img src="<?php echo HTTP_SERVER.'image/'.$label['image']; ?>"></div>
      <?php } ?>
      <?php } ?>
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
      </div>
      <div class="description main_font"><?php echo $product['description']; ?></div>
      <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <br />
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
          <div class="attributes">
       <!-- начинаем вывод атрибутов-->
       <?php if($product['attribute_groups']) { ?>
                <?php foreach($product['attribute_groups'] as $attribute_group) { ?>
                    <?php if(!strpos($attribute_group['name'], "—")) {?>
                        <?php foreach($attribute_group['attribute'] as $attribute) { ?>
                        <!--если нам надо определенный атрибут -->
                             <?php if(in_array($attribute['attribute_id'], array(18,4))){?>
                               <b><?php echo $attribute['name']; ?></b> <?php echo $attribute['text']; ?><br>
                             <?php } ?>
                        <!--если нам надо определенный атрибут -->
                        <?php } ?>
                    <?php } ?>
                <?php } ?>
            <?php } ?>
 <!-- конец атрибутов-->
    </div>
      <div class="cart">       
      <button type="submit" class="button contrast" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" ><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
    </div>  
    <div class="icons_wrapper">
    <a class="sq_icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
    <a class="sq_icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a>
    <?php if ($cosyone_text_ql) {?>
    <a href="<?php echo $product['quickview']; ?>" rel="nofollow" class="sq_icon qlook quickview" data-tooltip="<?php echo $cosyone_text_ql; ?>"><i class="fa fa-eye"></i></a>
    <?php } ?>
    <a class="sq_icon contrast add_to_cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" data-tooltip="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a>
    <a class="plain_link wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
    <a class="plain_link compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
    </div>
        <?php if (($product['special']) && ($product['special_date_end'] > 0) && ($cosyone_product_countdown)) { ?>
    	<div class="offer_popup">
        <div class="offer_background"></div>
        <div class="offer_content">
        <div class="countdown <?php echo $product['product_id']; ?>"></div>
        <?php if ($cosyone_product_hurry) { ?>
        <span class="hurry main_font"><?php echo $product['stock_quantity']; ?></span>
        <?php } ?>
        </div>
        </div>
		<script type="text/javascript">
		$('.<?php echo $product['product_id']; ?>').countdown({
		until: <?php echo $product['special_date_end']; ?>, 
		layout: '<span class="main_font"><?php echo $text_category_expire; ?></span><br /><i>{dn}</i> {dl}&nbsp; <i>{hn}</i>  {hl}&nbsp; <i>{mn}</i>  {ml}&nbsp; <i>{sn}</i> {sl}'});
		</script>
    	<?php } ?>
    	</div>
    </div><!--
    --><?php } ?>
    </div>
    </div>
  <div class="pagination_holder row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
  <?php } else { ?>
  <p><?php echo $text_empty; ?></p>
  <div class="buttons">
  <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>
  <script type="text/javascript">
$(function() {
	var pv = $.cookie('product_view');
	if (pv == 'g') {
		$('#main').removeClass();
		$('#main').addClass('product-grid');
		$('#list_view_icon').removeClass();
		$('#grid_view_icon').addClass('active');
	} else if (pv == 'l') {
		$('#main').removeClass();
		$('#main').addClass('product-list');
		$('#grid_view_icon').removeClass();
		$('#list_view_icon').addClass('active');
	} else {
		$('#<?php echo $cosyone_default_view?>_view_icon').addClass('active');
	}
});
$(document).ready(function() {
	$('#grid_view_icon').click(function() {
		$(this).addClass('active');
		$('#list_view_icon').removeClass();
		$('#main').fadeOut(300, function() {
			$(this).removeClass();
			$(this).addClass('product-grid').fadeIn(300);
			$.cookie('product_view', 'g');
		});
		return false;
	});
	$('#list_view_icon').click(function() {
		$(this).addClass('active');
		$('#grid_view_icon').removeClass();
		$('#main').fadeOut(300, function() {
			$(this).removeClass();
			$(this).addClass('product-list').fadeIn(300);
			$.cookie('product_view', 'l');
		});
		return false;
	});
});
</script>
</div>
<?php echo $footer; ?>