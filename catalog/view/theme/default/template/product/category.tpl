<?php echo $header; ?>


<div class="container">

    <div class="box-subcat">
        <ul>
            <?php foreach ($categories as $category) { $i++; ?>
                <li>
                    <a href="<?php echo $category['href']; ?>">
                        <i style="color: red;
    font-weight: bold;
    font-size: 24px; margin-right: 10px" class="fa fa-angle-right"></i>

                        <?php if(strlen($category['name']) > 35){
                                echo mb_strimwidth($category['name'], 0, 35, "...");;
                            }else{
                                echo $category['name'];
                            } ?>

                    </a>
                </li>
            <?php } ?>
        </ul>
    </div>


    <!--хлебние крошки-->
    <ul class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
        <?php foreach ($breadcrumbs as $i => $breadcrumb) { ?>
        <? if(isset($breadcrumbs[$i+1])): ?>
        <li typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url"
                                     property="v:title"><?php echo $breadcrumb['text']; ?></a></li>
        <? else: ?>
        <li><?php echo $breadcrumb['text']; ?></li>
        <? endif; ?>
        <?php } ?>
    </ul>
    <!--конец хлебних-->


    <h1 class="text-left"><?php echo $heading_title; ?></h1>

    <?php echo $column_left; ?>
    <?php echo $content_top; ?>

    <div id="content" class=" <?php echo $cosyone_grid_category; ?> col-md-9">

        <?php if ($products) { ?>
        <div class="filter_wrapper">


            <!--<div class="open_close_filter">
              <span class="opened"> Открыть фильтр</span>
           </div>
            <!--фильтр товаров категори
            <div class="product-filter">
              <!-- <div class="display">
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
              </div> -->
            <div class="sort"><span><?php echo $text_sort; ?></span>
                <select id="input-sort" onchange="location = this.value;">
                    <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['href']; ?>"
                            selected="selected"><?php echo $sorts['text']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>

            </div>
            <!-- <div class="compare-link mobile_hide"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
         </div>
         </div>
           <?php echo $content_bottom; ?>
         <!--Конец фильтра-->


            <div id="main" class="product-<?php echo $cosyone_default_view; ?>">
                <div class="grid_holder clearfix">


                    <?php foreach ($products as $product) { ?>
                    <div class="item contrast_font col-lg-4 col-md-4 col-sm-12 col-xs-12 seller product-layout">

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
                            <div class="image_hover"><a href="<?php echo $product['href']; ?>"><img
                                            src="<?php echo $product['thumb_hover']; ?>"
                                            alt="<?php echo $product['name']; ?>"/></a></div>
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                           alt="<?php echo $product['name']; ?>"/></a>
                            <?php } elseif ($product['thumb']) { ?>
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                           alt="<?php echo $product['name']; ?>"/></a>
                            <?php } ?>
                            <?php if($product['labels']) { ?>
                            <?php foreach ($product['labels'] as $label) { ?>
                            <div class="<?php echo $label['position']; ?>"><img
                                        src="<?php echo HTTP_SERVER.'image/'.$label['image']; ?>"></div>
                            <?php } ?>
                            <?php } ?>
                            <?php if ($cosyone_text_ql) { ?>
                            <div class="main_quicklook">
                                <a href="<?php echo $product['quickview']; ?>" rel="nofollow"
                                   class="button quickview"><i class="fa fa-eye"></i> <?php echo $cosyone_text_ql; ?>
                                </a>
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
                        <!-- 		<?php if ($product['price']) { ?>
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
                                    <button type="submit" class="button contrast"
                                            onclick="cart.add('<?php echo $product['product_id']; ?>');">
                                        <!-- <i class="fa fa-shopping-cart"></i> --> <?php echo $button_cart; ?></button>
                                </div>
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

                                <div class="name"><a
                                            href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                </div>
                                <?php if ($product['brand_name'] && $cosyone_brand) { ?>
                                <span class="brand main_font"><?php echo $product['brand_name']; ?></span>
                                <?php } ?>
                                <?php if ($product['rating']) { ?>
                                <div class="rating"><span class="rating r<?php echo $product['rating']; ?>"><i
                                                class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                class="fa fa-star"></i></span></div>
                                <?php } ?>
                            </div><!-- left wrapper ends -->
                            <?php if ($product['price']) { ?>
                            <div class="price">
                                <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?>
                                <?php } else { ?>
                                <span class="price-old"><?php echo $product['price']; ?></span> <span
                                        class="price-new"><?php echo $product['special']; ?></span>
                                <?php } ?>
                            </div>
                            <?php } ?>
                            <div class="cart mobile">
                                <button type="submit" class="button contrast"
                                        onclick="cart.add('<?php echo $product['product_id']; ?>');">
                                    <!-- <i class="fa fa-shopping-cart"></i> --> <?php echo $button_cart; ?></button>
                            </div>
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
                    <!--Конец форича-->

                </div>
            </div>
            <!--Конец #main-->


            <div class="pagination_holder row">
                <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
                <!-- <div class="col-sm-6 text-right"><?php echo $results; ?></div> -->
            </div>

        </div>
        <?php } ?>
        <!--конец продуктов-->


        <!--описание и превью подкатегорий-->
        <?php if ($thumb || $description) { ?>
        <div class="category-info">
            <?php if ($cosyone_category_thumb == 'enabled' && ($thumb)) { ?>
            <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>"/></div>
            <?php } ?>
            <?php if ($description) { ?>
            <?php echo $description; ?>
            <?php } ?>
        </div>
        <?php } ?>


        <?php if (!$categories && !$products) { ?>
        <div class="content"><?php echo $text_empty; ?></div>
        <div class="buttons">
            <div class="pull-right"><a href="<?php echo $continue; ?>"
                                       class="button"><?php echo $button_continue; ?></a></div>
        </div>
        <?php } ?>


        <?php echo $column_right; ?>


        <script type="text/javascript">
            $(function () {
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
            $(document).ready(function () {
                $('#grid_view_icon').click(function () {

                    $(this).addClass('active');
                    $('#list_view_icon').removeClass();
                    $('#main').fadeOut(300, function () {
                        $(this).removeClass();
                        $(this).addClass('product-grid').fadeIn(300);
                        $.cookie('product_view', 'g');
                    });
                    return false;
                });
                $('#list_view_icon').click(function () {
                    $(this).addClass('active');
                    $('#grid_view_icon').removeClass();
                    $('#main').fadeOut(300, function () {
                        $(this).removeClass();
                        $(this).addClass('product-list').fadeIn(300);
                        $.cookie('product_view', 'l');
                    });
                    return false;
                });

            });
        </script>


    </div>
    <!--Конец #content-->

</div>
</div>
<!--Конец .container-->
<?php echo $footer; ?>