<?php echo $footer_modules ?>
<footer>
<div id="footer">

 <div class="container">






	<div class="column">
		<div class="box-heading heading"><?php echo $text_information; ?></div>
		<ul class="contrast_font">
			<?php if ($informations) { ?>
			<?php foreach ($informations as $information) { ?>
			<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
			<?php } ?>
			<?php } ?>
			<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
		</ul>
	</div>

	<div class="column">
		<div class="box-heading heading"><?php echo $text_extra; ?></div>
		<ul class="contrast_font">
			<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
			<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
			<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
			<!-- <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li> -->
			<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
		</ul>
	</div>

	<div class="column">
		<div class="box-heading heading"><?php echo $text_account; ?></div>
		<ul class="contrast_font">
			<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
			<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
			<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
			<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
			<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
		</ul>
	</div>



	<div class="column">
		<div class="box-heading heading">
			<?php echo $cosyone_footer_custom_block_title; ?>
		</div>
		<div class="custom_block">
			<?php echo $cosyone_footer_custom_block; ?>
		</div>
	</div>




</div>

</div>
<div style="text-align: center;">&copy; 2010 - <?php echo date('Y'); ?> - Интернет - магазин мебели Meblaks</div>
</footer>
<!-- #footer ends -->




<script type="text/javascript" src="catalog/view/theme/default/js/jquery.cookie.js"></script>

<script type="text/javascript" src="catalog/view/theme/default/js/colorbox/jquery.colorbox-min.js"></script>
<link href="catalog/view/theme/default/js/colorbox/custom_colorbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="catalog/view/theme/default/js/quickview.js"></script>

<?php if($cosyone_use_retina) { ?>
	<script type="text/javascript" src="catalog/view/theme/default/js/retina.min.js"></script>
<?php } ?>


<?php echo $live_search; ?>
<?php echo $cosyone_cookie; ?>
</body>

</html>
