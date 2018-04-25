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

   <?php echo $column_left; ?>


    <div id="coicons_absolutentent" class="product" itemscope itemtype="http://data-vocabulary.org/Product">

    <?php echo $content_top; ?>

      <h1 itemprop="name"><?php echo $heading_title; ?></h1>

  <div class="product-info clearfix">
    <?php if ($thumb || $images) { ?>

    <div class="col-xs-12">
      <!--Главная картинка-->
          <!-- wrapper for col -->
      <?php if ($thumb) { ?>
      <div class="col-sm-6">
      <div class="image">


      <?php if ($cosyone_product_zoom) { ?>
      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" style="cursor:move" rel="position:'inside', showTitle: false" id='zoom1'><img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
      <!-- zoom link-->
      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" id="zoom-btn" class="colorbox" rel="colorbox"><i class="fa fa-search-plus"></i></a>
      <?php } else { ?>
      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
      <?php } ?>

      <!--значок скидки-->
      <?php if ($cosyone_percentage_sale_badge == 'enabled' && !!$special) { ?>
    <div class="sale_badge">-<?php echo $sales_percantage_main; ?>%</div>
      <?php } ?>
      <!--конец скидки-->
      </div>
        <!--Доп картинки-->
      <?php if ($images) { ?>

      <div class="image-additional" style="width:<?php echo $thumb_width; ?>px; height:<?php echo $additional_height; ?>px">
      <ul class="image_carousel">
       <!-- Additional images -->
        <?php foreach ($images as $image) { ?>
        <li>
        <?php if ($cosyone_product_zoom) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>'">
        <?php } else { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>'">
        <?php } ?>
        <img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" width="<?php echo $additional_width; ?>" height="<?php echo $additional_height; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
        <?php } ?>

        <!-- Show even the main image among the additional if  -->
         <?php if ($cosyone_product_zoom) { ?>
       <li><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery colorbox" rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>'"><img src="<?php echo $small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" width="<?php echo $additional_width; ?>" height="<?php echo $additional_height; ?>"/></a></li>
        <?php } ?>
        </ul>

      </div>
      <?php } ?>
      <!--конец Доп картинки-->
      </div>

      <?php } ?>
      <!--конец Главная картинки-->


      <!--Описание товара краткое-->
        <div class="col-sm-6">

       <div id="product">

       <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
      <?php } ?>

      <?php if ($options) { ?>
      <div class="options">

      <h2><?php echo $text_option; ?></h2>
        <?php foreach ($options as $option) { ?>

        <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>

        <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>

        <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>



         <?php if ($option['type'] == 'image') { ?>
         <?php if($cosyone_image_options == 'thumbs'){ ?>
         <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
         <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
         <div id="input-option<?php echo $option['product_option_id']; ?>" class="clean-option-image">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <div class="single-option main_font" <?php if ($option_value['price']) { ?>data-tooltip="<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>"<?php } ?>>
              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>" /></label>
                </div>
            <?php } ?>
          </div>
          </div>
         <?php } else { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php } ?>

        <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>

        <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label><br />
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="button"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
         <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
        <?php } ?>


      </div> <!-- .options ends -->


      <?php } ?>
        <!--Якщо є акційна ціна-->






        <?php if (($special_date_end > 0) && ($cosyone_product_countdown)) { ?>
        <div class="offer"></div>

    <?php if ($cosyone_product_hurry) { ?>
        <div class="hurry">
        <span class=""><?php echo $text_stock_quantity; ?></span>
        <span class=""><?php echo $text_items_sold; ?></span>
        </div>
    <?php } ?>
        <?php } ?>

        <?php } ?>
        <!--End if price-->
      <div class="cart clearfix">

      <?php if ($price) { ?>
      <div class="price">
        <?php if (($special) && ($cosyone_product_yousave)) { ?>

    <div class="extended_offer">


    <div class="old-price"><span class=""><?php echo $price; ?></span></div>
    <div class="old-price"><span class=""><?php foreach ($products as $product) { ?>
    <?php if ($product['special']) { ?><span style="color:green">[<?php echo $product['percent']; ?>]</span><?php } break;} ?>  -<?php echo $yousave; ?></span> </div>
    </div>

    <?php } ?>
   <!--кінець акційнї ціни-->





 <?php if (!$special) { ?>
        <span itemprop="price"><span style="font-size:22px;">Цена: </span><?php echo $price; ?></span>
        <?php
          if($manufacturer=='Биформер') { ?>
          <span style="color:green;">+Бесплатная доставка </span>
        <?php } ?>

        <?php } else { ?>
        <?php if (!$cosyone_product_yousave) { ?>
        <span class="mainprice"><?php echo $price; ?></span> <span class="mainprice" itemprop="price"><span style="font-size:22px;">Цена: </span><?php echo $special; ?></span>
        <?php } ?>

        <?php } ?>
          <?php if (($special) && ($cosyone_product_yousave)) { ?>




    <span  class="mainprice" itemprop="price"><span style="font-size:22px;">Цена: </span><?php echo $special; ?></span>


    <?php } ?>


        </div>

      <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

          <span class="zakazat"><button type="submit" onclick="ga('send', 'pageview', '/virtual/addtocart');" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class=""><?php echo $button_cart; ?></button></span>
      </div>

     </span> <!-- rich snippet ends -->
      <?php } ?>


<!--           <a class="quantity_button minus icon">-</a><input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="quantity" /><a class="quantity_button plus icon">+</a> -->



          <!--Кнопки сравнения-->
          <!--<div class="icons_wrapper">
    <a class="sq_icon" onclick="wishlist.add('<?php echo $product_id; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
    <a class="sq_icon compare" onclick="compare.add('<?php echo $product_id; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left main_compare"></i></a>
        </div>-->
        <!--Конец кнопок-->


       </div> <!-- Cart ends -->
               <!--Кнопки отзивов-->
               <?php if ($sku) { ?>
    <div class="sku"><?php echo $text_sku; ?> <?php echo $sku; ?></div>
<?php } ?>
      <div class="descr">


     <?php if ($attribute_groups) { ?>
  <div style="    font-size: 18px;
    font-family: 'PT Sans Bold', arial;">Характеристики</div>
    <div class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>



        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <ul>
          <li><?php echo $attribute['name']; ?>:</li>
          <li><?php echo $attribute['text']; ?></li>
        </ul>
        <?php } ?>

      <?php } ?>
   </div>

  <?php } ?>
        <?php if ($manufacturer) { ?>
        <div class="manufacturer">
          <span class=""><?php echo $text_manufacturer; ?></span> <a class="small_text" href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        </div>
        <?php } ?>

       <!--  <span class=""><?php echo $text_model; ?></span><span class="small_text"><?php echo $model; ?></span><br /> -->


       <!--
        <?php if ($reward) { ?>
        <span class=""><?php echo $text_reward; ?></span><span class="small_text"><?php echo $reward; ?></span><br />
        <?php } ?>
         -->
        <!-- <span class="" itemprop="availability" content="<?php if ($data_qty > 0) {echo "in_stock"; } else {echo "out_of_stock"; } ?>"><?php echo $text_stock; ?></span> <span class="small_text" style="text-decoration:underline;"><?php echo $stock; ?></span>
         -->
         <!-- .Описание ends -->


        <?php if ($price) { ?>
        <meta itemprop="currency" content="<?php echo $currency_code; ?>" />
        <span itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer"><!-- Rich snippets start -->




      <?php if ($review_status) { ?>
      <div class="review">
       <span class="rating r<?php echo $rating; ?>">
       <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
       </span>
       <span>
        <a class="to_review" onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>
        <!-- <a class="to_review" onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a></span> -->
        </div>

        <?php if ($count_reviews > 0) { ?><!-- Rich snippet start -->
        <div itemprop="review" itemscope itemtype="http://data-vocabulary.org/Review-aggregate">
        <span itemprop="rating" content="<?php echo $rating; ?>"></span><span itemprop="count" content="<?php echo $reviews; ?>"></span>
        </div>
        <?php } ?><!-- Rich snippet end -->

      <?php } ?>
       <!--Конец кнопок-->



       <?php if ($manufacturer) { ?>
       <a class="choise math" href="#" target="_blank">Выбор материала</a>
       <a class="choise math1" href="#" target="_blank">Выбор обивки</a>
       <a class="choise math2" href="#" target="_blank">Выбор дерева</a>
    <a class="choise dsp" href="#" target="_blank">Цвет ДСП</a>
        <?php } ?>


     </div>




   <div class="icons_absolute">
      <div>

      <p>Доставка
 <br>по Украине</p>
      </div>
      <div>

      <p> Гарантия <br> 18 месяцев</p>
      </div>
      <div>

      <p>Индивидуальный подход <br>к каждому клиенту </p>
      </div>

    </div>





       </div>
      </div>
      <!-- wrapper for col -->




  <!--Поделиться товаром-->
  <?php if($cosyone_product_share == 'image'){ ?>

      <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
        <a class="addthis_button_preferred_1"></a>
        <a class="addthis_button_preferred_2"></a>
        <a class="addthis_button_preferred_3"></a>
        <a class="addthis_button_preferred_4"></a>
        <a class="addthis_button_compact"></a>
        <a class="addthis_counter addthis_bubble_style"></a>
        </div>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script>
      <?php } ?>
      <!--Конец кнопок поделиться-->


      <?php } ?>
      <!--Конец if ($thumb || $images)-->









    </div> <!-- product-info END -->



  <ul class="nav nav-tabs product-page">

  <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>

   <!--  <?php if ($attribute_groups) { ?>
    <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
    <?php } ?> -->

    <?php if ($review_status) { ?>
    <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
    <?php } ?>
       <li> <a href="#tab-delivery" data-toggle="tab">
          Оплата и доставка
            </a>
       </li>

    <?php if ($product_tabs_5) { ?>
  <?php foreach($product_tabs_5 as $product_tab_5) { ?>
  <li><a href="#tab-product-tab<?php echo $product_tab_5['tab_id'];?>" data-toggle="tab"><?php echo $product_tab_5['name']; ?></a></li>
  <?php } ?>
  <?php } ?>


  </ul>

  <div class="tab-content">

  <div class="tab-pane active" id="tab-description"><?php echo $description; ?>
  <?php if ($tags) { ?>
  <div class="tags">
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  </div>

  <?php if ($attribute_groups) { ?>
  <div class="tab-pane" id="tab-specification">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <div class="tab-pane" id="tab-delivery">
    <div class="delivery"><div class="container"><p><strong>«Меблакс»</strong> предлагает Вам все преимущества покупок через интернет с возможностью получения товара в удобном для Вас месте и в удобное время.</p>



<p class="h2" style="text-align:center;">Варианты  доставки</p>



<p><strong>Курьерская доставка  в городе Черкассы (при наличии товара на складе в городе Черкассы)</strong><br>При оформлении покупки Вы согласовываете с оператором магазина дату и адрес доставки. В назначенный день наш курьер свяжется с вами и уточнит удобное для вас время доставки. При получении заказа вам необходимо иметь при себе паспорт, а юридическому лицу – кроме документа, удостоверяющего личность, доверенность на получение товара. Стоимость курьерской доставки 50,00 грн. При оформлении заказа свыше 1000,00 грн – курьерская доставка <strong>бесплатна!</strong>Курьерская доставка осуществляется до подъезда либо ворот жилого дома.</p>



<p><strong>Доставка по Украине транспортными компаниями согласно их тарифов</strong><br>Мы можем выслать Вам товар любым удобным для вас перевозчиком:<br>
</p>


<div class="perevozchik"><img src="/image/catalog/what/np.png">"Новая почта" </div>



<div class="perevozchik"><img src="/image/catalog/what/intime.png">"Интайм"</div>



<div class="perevozchik"><img src="/image/catalog/what/delivery.png">"Деливери"</div>



<div class="perevozchik"><img src="/image/catalog/what/meest.png">"Міст Експрес" </div>



<div class="perevozchik"><img src="/image/catalog/what/autolux.png">"Автолюкс".</div>


<br>
 Стоимость доставки рассчитывается транспортной компанией исходя из массы и габаритов товара, а также в зависимости от выбранного вами типа доставки: на склад перевозчика или адресная доставка. Доставку вы оплачиваете самостоятельно по прибытии заказа в Ваш населенный пункт.<p></p>



<p class="h2" style="text-align:center;">Строки доставки</p>



<p>Сроки доставки необходимо уточнять у менеджера. Если товар имеется в наличии на складе, Вам его доставят в течение 2-3 дней. При отсутствии необходимого товара на складе, оператор магазина сообщит вам сроки выполнения заказа.</p>



<p class="h2" style="text-align:center;">Проверка товара</p>



<p>Получить Ваш заказ со склада перевозчика или при адресной доставке Вы сможете, предъявив свой паспорт и номер декларации.</p>



<p class="h2" style="text-align:center;">После доставки товара к Вам, внимательно осмотрите целостность упаковки самого изделия.</p>



<p>- проверьте упаковку на наличие сколов и потертостей;<br>- при получении товара, обязательно проверяйте количество доставленных коробок, они должны соответствовать количеству заявленном в ТТН;<br>- убедитесь в том, что изделие укомплектовано необходимой фурнитурой и крепежными элементами;<br>- тщательно осмотрите стеклянные детали.</p>



<p>Мы ценим время и нервы своих клиентов, поэтому весь наш товар проходит тщательную проверку перед отправкой со склада. Условия гарантийного обслуживания смотрите в разделе <a href="/Guarantees">«Гарантии»</a>.</p>

<p class="h2" style="text-align:center;">Оплата</p>
<p>Заказ является принятым в работу только после предоплаты на карту интернет-магазина. Полная оплата может осуществляться следующими способами:</p>
<p class="h2" style="text-align:center;">Наличный расчет</p>
<p>Оплата наличными возможна при получении товара в городе Черкассы.</p>
<p class="h2" style="text-align:center;">Приват 24</p>
<p>Подходит для пользователей сервиса Приват 24. Вы можете произвести оплату своего заказа посредством данной системы, переведя необходимую сумму денег на карту интернет-магазина. (комиссия 0,5%)</p>
<p class="h2" style="text-align:center;">Через платежный терминал</p>
<p>Вы можете оплатить свою покупку через любой терминал самообслуживания, сделав денежный перевод на карточку интернет-магазина. (комиссия 1-2% в зависимости от банка плательщика)</p>
<p class="h2" style="text-align:center;">Наложеный платеж</p>
<p>Оплата при получении товара у службы перевозчика. 9комисия 2% от стоимости товара.</p>







</div>



</div>
  </div>
  <?php if ($review_status) { ?>
  <div class="tab-pane" id="tab-review">
    <form id="form-review" class="form-horizontal">
    <div id="review"></div>
    <div class="write_review contrast_font">
    <h2 id="review-title"><?php echo $text_write; ?></h2>


    <?php if ($review_guest) { ?>

   <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>

    <div class="form-group required">
    <div class="col-sm-12">
    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
    <textarea name="text" id="input-review" rows="8" style="width: 100%;"></textarea>
    <small><?php echo $text_note; ?></small>
    </div>
    </div>

    <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <span class="main_font"><?php echo $entry_bad; ?></span>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<span class="main_font"><?php echo $entry_good; ?></span>
                    </div>
                </div>

                <div class="form-group">
                <div class="col-sm-6">
                <?php if ($site_key) { ?>
                <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                <?php } ?>
                </div>
                <div class="col-sm-6"><a id="button-review" class="button pull-right"><?php echo $button_continue; ?></a></div>
                </div>
                </div>
                <?php } else { ?>
                <div class="alert alert-info main_font"><?php echo $text_login; ?></div>
                </div>
                <?php } ?>
                </form>
                </div>
                <?php } ?>

  <?php if ($product_tabs_5) { ?>
  <?php foreach($product_tabs_5 as $product_tab_5) { ?>
    <div class="tab-pane" id="tab-product-tab<?php echo $product_tab_5['tab_id'];?>">
  <?php echo $product_tab_5['text']; ?>
    </div>
  <?php } ?>
  <?php } ?>

  </div>



      <!-- Продукты рекомендуемые  -->

    <?php if ($products) { ?>


    <div class="h3"><?php echo $text_related; ?></div>
    <div class="<?php echo $cosyone_grid_related; ?>">
    <div class="grid_holder">
    <div class="product-grid carousel related"><!--Ці класи викликають внизу карусель-->
      <?php foreach ($products as $product) { ?>


      <div class="item contrast_font seller product-layout">


         <div class="image">


              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>

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

        </div><!-- informtion wrapper ends -->

        <!--

        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

  <?php if ($product['rating']) { ?>
  <div class="rating"><span class="rating r<?php echo $product['rating']; ?>"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span></div>
  <?php } ?>



        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class=""><?php echo $product['price']; ?></span> <span class=""><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>


        <div class="cart">
    <button type="submit" class="button contrast" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" ><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
  </div>
   -->
  <!--
        <div class="icons_wrapper">
    <a class="sq_icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a><a class="sq_icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a>
    <?php if ($cosyone_text_ql) { ?>
    <a href="<?php echo $product['quickview']; ?>" rel="nofollow" class="sq_icon qlook quickview" data-tooltip="<?php echo $cosyone_text_ql; ?>"><i class="fa fa-eye"></i></a>
    <?php } ?>
    <a class="sq_icon contrast add_to_cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" data-tooltip="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a>
    <a class="plain_link wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
    <a class="plain_link compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
        </div>-->



      </div>
      <?php } ?>

    </div>


  <?php } ?>





  <?php echo $content_bottom; ?>
  <?php echo $column_right; ?>

  </div>
 </div>
 </div>
<script type="text/javascript" src="catalog/view/theme/default/js/cloud-zoom.1.0.2.min.js"></script>

<script type="text/javascript"><!--
$(document).ready(function() {
   $('.colorbox').colorbox({
      overlayClose: true,
    maxWidth:'95%',
    rel:'gallery',
      opacity: 0.5
});
});
//--></script>
<script type="text/javascript">
        jQuery(function($) {
      //Product thumbnails
      $(".cloud-zoom-gallery").last().removeClass("cboxElement");
      $(".cloud-zoom-gallery").click(function() {
        $("#zoom-btn").attr('href', $(this).attr('href'));
        $("#zoom-btn").attr('title', $(this).attr('title'));

            $(".cloud-zoom-gallery").each(function() {
            $(this).addClass("cboxElement");
          });
          $(this).removeClass("cboxElement");
              });

        });
</script>
<script type="text/javascript">
$(document).ready(function() {
var owlAdditionals = $('.image_carousel');
var wrapperWidth = $(".image-additional").width();
var itemWidth = (<?php echo $additional_width; ?> + 10);
var itemcalc = Math.round(wrapperWidth / itemWidth);
owlAdditionals.owlCarousel({
items : itemcalc,
itemsCustom: [[0, 2], [550, 3], [768, 3], [1025, 3]],
mouseDrag: true,
responsive:true,
pagination: false,
navigation:true,
slideSpeed:200,
navigationText: [
"<div class='slide_arrow_prev add_img'><i class='fa fa-angle-left'></i></div>",
"<div class='slide_arrow_next add_img'><i class='fa fa-angle-right'></i></div>"
]
});
});
</script>
<script type="text/javascript">
$(document).ready(function() {
var grid5 = 5;
var grid4 = 4;
var grid3 = 3;
var owlRelated = $('.product-grid.related.carousel');
owlRelated.owlCarousel({
itemsCustom: [ [0, 1], [350, 2], [550, 3], [1025, <?php echo $cosyone_grid_related; ?>]],
pagination: false,
navigation:true,
slideSpeed:500,
scrollPerPage:false,
navigationText: [
"<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
"<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"]
});
});
</script>
<script type="text/javascript">
$('.quantity_button.plus').on('click', function(){
        var oldVal = $('input.quantity').val();
        var newVal = (parseInt($('input.quantity').val(),10) +1);
      $('input.quantity').val(newVal);
    });

    $('.quantity_button.minus').on('click', function(){
        var oldVal = $('input.quantity').val();
        if (oldVal > 1)
        {
            var newVal = (parseInt($('input.quantity').val(),10) -1);
        }
        else
        {
            newVal = 1;
        }
        $('input.quantity').val(newVal);
    });
</script>
<?php if ($special_date_end > 0) { ?>

<script type="text/javascript">
  $('.offer').countdown({
    until: <?php echo $special_date_end ?>,
    layout: '{desc}<i>{dn}</i> {dl} <i>{hn}</i> {hl} <i>{mn}</i> {ml} <i>{sn}</i> {sl}',
    description: '<span class="main_font"><?php echo $text_expire ?></span>&nbsp;'
    });
</script>
<?php } ?>
<script type="text/javascript">
$(".to_review").click(function() {
    $('html, body').animate({
        scrollTop: $("#tab-review").offset().top
    }, 1000);
});
</script>

<!-- Default scrips below -->
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
  $.ajax({
    url: 'index.php?route=product/product/getRecurringDescription',
    type: 'post',
    data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
    dataType: 'json',
    beforeSend: function() {
      $('#recurring-description').html('');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();

      if (json['success']) {
        $('#recurring-description').html(json['success']);
      }
    }
  });
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));

            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }

        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }

        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }

      if (json['success']) {

        $.colorbox({
 html:'<div class="cart_notification"><div class="product"><span><img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></span><span>' + json['success'] + '</span></div><div class="bottom"><a href="/" class="button contrast"><?php echo $button_shopping; ?></a>' + '<a class="button contrast" href="/index.php?route=checkout/cart">Оформление заказа</a></div></div>',
  className: "notification",
  initialHeight:50,
  initialWidth:50,
  width:"90%",
  maxWidth:400,
  height:"90%",
  maxHeight:200

});

        $('#cart-total').html(json['total']);

        $('#cart').load('index.php?route=common/cart/info #cart > *'); //Added
      }
    }
  });
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});

$('.time').datetimepicker({
  pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);

      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $('.text-danger').remove();

          if (json['error']) {
            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
          }

          if (json['success']) {
            alert(json['success']);

            $(node).parent().find('input').attr('value', json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
  $.ajax({
    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
    type: 'post',
    dataType: 'json',
    data: $("#form-review").serialize(),
    beforeSend: function() {
      $('#button-review').button('loading');
    },
    complete: function() {
      $('#button-review').button('reset');
    },
    success: function(json) {
      $('.alert-success, .alert-danger').remove();

      if (json['error']) {
        $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }

      if (json['success']) {
        $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').prop('checked', false);
      }
    }
  });
});
//--></script>

</div>
<?php echo $footer; ?>
