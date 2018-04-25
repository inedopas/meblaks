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
    <div id="content" class="<?php echo $class; ?> <?php echo $cosyone_grid_category; ?>">
   
  <h1 class="text-left"><?php echo $heading_title; ?></h1>
  <?php if ($products) { ?>
  

<div class="filter_wrapper">
    
  
  <div class="open_close_filter">
    <span class="opened"> Открыть фильтр</span>
 </div>
  <!--фильтр товаров категори-->
  <div class="product-filter">
  
    <div class="sort"><span><?php echo $text_sort; ?></span>
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
     <!-- <div class="compare-link mobile_hide"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div> -->
  </div>
  </div>

    
<!-- filter end -->
<div id="main" class="product-<?php echo $cosyone_default_view; ?>">
  <div class="grid_holder clearfix">
  
  
    <?php foreach ($products as $product) { ?>
      <div class="item contrast_font col-lg-4 col-md-4 col-sm-6 col-xs-6 seller product-layout">

  
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

        </div><!-- informtion wrapper ends -->
     
     
  
        
      
    </div><!--Конец .item-->






      
      
     
    
   <?php } ?>
   <!--Конец форича-->
    
    </div>
    </div>
  <!--Конец #main-->
   <div class="pagination_holder row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
        <!-- <div class="col-sm-6 text-right"><?php echo $results; ?></div> -->
      </div>
  <?php } else { ?>
  <p><?php echo $text_empty; ?></p>
  <div class="buttons">
  <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
 </div>
</div>
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