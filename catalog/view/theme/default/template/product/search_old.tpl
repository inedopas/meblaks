<?php echo $header; ?>
<div class="container">
<!--хлебние крошки-->
  <ul class="breadcrumb"  xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $i => $breadcrumb) { ?>
	<? if(isset($breadcrumbs[$i+1])): ?>
    <li  typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></li>
	<? else: ?>
		<li><?php echo $breadcrumb['text']; ?></li>
	<? endif; ?>
    <?php } ?>
  </ul>
<!--конец хлебних-->
  <div class="row"><?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> <?php echo $cosyone_grid_category; ?> search-page">
    <?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <h3 class="margin-b"><?php echo $entry_search; ?></h3>
      <div class="row">
        <div class="col-sm-6 form-group">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-6 form-group">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        </div>
        
        <div class="row">
        <div class="col-sm-6 form-group">
          <label class="checkbox-inline main_font">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
        </div>
        <div class="col-sm-6 form-group">
          <p><label class="checkbox-inline main_font">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label></p>
        </div>
      </div>
      <div class="form-group">
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
      </div>
      <h3><br />
<?php echo $text_search; ?></h3>
      
  <?php if ($products) { ?>
  <div class="product-filter" style="width:100%; padding:15px;">
   
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
    <div class="sort" style="margin-top:10px;"><?php echo $text_sort; ?>
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
     
  </div>
  <div id="main" class="product-<?php echo $cosyone_default_view; ?>">
  <div class="grid_holder">
    <?php foreach ($products as $product) { ?><!--

    -->

      <div class="item contrast_font col-lg-4 col-md-4 col-sm-6 col-xs-6 seller product-layout">
     <div class="image">
          
        
            <?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
            <?php } ?>
                        <?php if($product['labels']) { ?>
      <?php foreach ($product['labels'] as $label) { ?>
            <div class="<?php echo $label['position']; ?>"><img src="<?php echo HTTP_SERVER.'image/'.$label['image']; ?>"></div>
      <?php } ?>
      <?php } ?>        
               
            </div> 




            <div class="hidden_hover">
                    <div class="hidden_content">
                        
                

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
     

                <div class="cart"><button type="submit" class="button contrast" onclick="cart.add('<?php echo $product['product_id']; ?>');" ><!-- <i class="fa fa-shopping-cart"></i> --> <?php echo $button_cart; ?></button></div> 
                <!-- <div class="icons_wrapper">
    <a class="sq_icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
    <a class="sq_icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a>
    <?php if ($cosyone_text_ql) {?>
    <a href="<?php echo $product['quickview']; ?>" rel="nofollow" class="sq_icon qlook quickview" data-tooltip="<?php echo $cosyone_text_ql; ?>"><i class="fa fa-eye"></i></a>
    <?php } ?>
    <a class="sq_icon contrast add_to_cart" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a>
    <a class="plain_link wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
    <a class="plain_link compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
    </div> -->
        </div>
            </div>


        <div class="information_wrapper">
                <div class="left">
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
              <!--   <?php if ($product['brand_name'] && $cosyone_brand) { ?>
                <span class="brand main_font"><?php echo $product['brand_name']; ?></span>
                <?php } ?> -->
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

        </div><!-- informtion wrapper ends -->
        </div>
    <?php } ?><!--
    --></div>
    </div>
  <div class="pagination_holder row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
        <!-- <div class="col-sm-6 text-right"><?php echo $results; ?></div> -->
      </div>
  <?php } else { ?>
  <p><?php echo $text_empty; ?></p>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script> 




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