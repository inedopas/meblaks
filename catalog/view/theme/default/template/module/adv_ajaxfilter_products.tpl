

<?php foreach ($products as $product) { ?>
 <div class="item contrast_font col-lg-4 col-md-4 col-sm-6 col-xs-6 seller product-layout">

    <!--  <div class="image">
      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
      <?php if($product['labels']) { ?>
      <?php foreach ($product['labels'] as $label) { ?>
            <div class="<?php echo $label['position']; ?>"><img src="<?php echo HTTP_SERVER.'image/'.$label['image']; ?>"></div>
      <?php } ?>
      <?php } ?>
</div> -->
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
      
      
      
     
          <!-- <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a> -->
       
               
                <!-- рейтинг товара-->
                <!--<?php if ($product['rating']) { ?>      
    <div class="rating"><span class="rating r<?php echo $product['rating']; ?>"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span></div>
    <?php } ?>-->
          <!--конец рейтинга-->
          
          
    <!-- <div class=""><?php echo $product['description']; ?></div> -->
    
    
    <!-- Цена товара-->
<!--    <?php if ($product['price']) { ?>
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
    <?php } ?> -->
    <!-- конец цени-->
  



 <div class="hidden_hover">
                    <div class="hidden_content">
                        <span class="sku"><?php echo $product['sku']; ?></span>

                

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
     
     
      <!--Кнопка купить-->
     <!--  <div class="cart">       
      <button type="submit" class="button contrast" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" ><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
      </div>   -->
      <!--конець кнопки купить-->
      
      <!--Якщо треба кнопки сравнения, добавления в закладки-->
      <!--<div class="icons_wrapper">
      <a class="plain_link wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
      <a class="plain_link compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
      </div>-->
      <!--Енд кнопок-->
        
      
    </div><!--Конец .item-->
<?php } ?>
<script type="text/javascript">
  $('.image_hover').css('display','none');

</script>