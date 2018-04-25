<style>
#reviews<?php echo $module;?>{
	overflow: hidden;
	background: #f8f8f8;
	margin-top: 10px;
	padding-bottom: 10px;
	padding-top: 10px;
	border: 1px #eaeaea solid;
}
#reviews<?php echo $module;?> .item{
	padding: 0px 20px 0px 20px;
}
#reviews<?php echo $module;?> .name{
	color: #222;
	font-size: 13px;
}
#reviews<?php echo $module;?> .author{
	color: #222;
	font-size: 18px;
	line-height: normal;
	display: block;
	margin-top: 5px;
	line-height: 30px;
}
#reviews<?php echo $module;?> .review-text{
	  margin: 0 0 0 10px;
	  quotes: none;
	  color: #333;
	  font-size: 16px;
	  font-weight: bold;
	  line-height: 1.6em;
	  font-family: Georgia, "Times New Roman", Times, serif;
	  font-style: italic;
	  display: inline-block;
}
.review-box{
	text-align: center;
}
.review-box h2 {
  color: #fff;
  font-size: 13px;
  font-weight: normal;
  padding: 5px 10px;
  text-transform: uppercase;
  display: inline-block;
  width: 180px;
  text-align: center;
  background: #222;
  letter-spacing: 1px;
}

</style>
<p class="what_text"><?php echo $module_name; ?></p>
<div class="review-box">
	
	<div id="reviews<?php echo $module;?>" class="owl-carousel">
		<?php foreach($reviews as $review):?>
		<div class="item">
		<div class="name">
	<!-- 	<?php echo $text_product;?> -->
	<strong><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></strong></div>
		<div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($review['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
			<div class="review-text">
				<p>
					<?php echo $review['description']?> <a href="<?php echo $review['href']?>"></a>
				</p>
			</div>

			<?php if($pauthor == 'true'):?>
				<div class="author"><?php echo $text_author;?><strong><?php echo $review['author']?></strong></div>
			<?php endif;?>
			<?php if($ratings == '1'):?>
				<?php if ($review['rating']) { ?>
                
                <?php } ?>
            <?php endif;?>
			<?php if ($review['product_id']):?>
				
			<?php endif;?>

		</div>
		<?php endforeach;?>
	</div>
</div>
<script type="text/javascript"><!--
$('#reviews<?php echo $module;?>').owlCarousel({
	items: <?php echo $count_item;?>,
	autoPlay: <?php echo empty($autoplay) ? '9000' : $autoplay;?>,
	singleItem: <?php echo $single == '1' ? 'true' : 'false';?>,
	navigation: <?php echo $navigation;?>,
	responsive: <?php echo $responsive;?>,
	responsiveRefreshRate : 200,
    responsiveBaseWidth: window,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: <?php echo $pagin;?>
});
--></script>