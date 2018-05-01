<?php


  //Если форма отправлена
  if(isset($_POST['submit'])) {
 //Проверка Поля ИМЯ
  if(trim($_POST['contactname']) == '') {
  $hasError = true;
  } else {
  $name = trim($_POST['contactname']);
  }
 //Проверка поля ТЕМА
  if(trim($_POST['subject']) == '') {
  $hasError = true;
  } else {
  $subject = trim($_POST['subject']);
  }
 //Проверка правильности ввода EMAIL
 //  if(trim($_POST['email']) == '')  {
 //  $hasError = true;
 // } else if (!preg_match("/^[[:alnum:]][a-z0-9_.-]*@[a-z0-9.-]+\.[a-z]{2,4}$/i", trim($_POST['email']))) {
 //  $hasError = true;
 //  } else {
 //  $email = trim($_POST['email']);
 //  }



// tel
   if(trim($_POST['phone']) == '') {
  $hasError = true;
  } else {
  $phone = trim($_POST['phone']);
  }
 //Проверка наличия ТЕКСТА сообщения
  // if(trim($_POST['message']) == '') {
  // $hasError = true;
  // } else {
  // if(function_exists('stripslashes')) {
  // $comments = stripslashes(trim($_POST['message']));
  // } else {
  // $comments = trim($_POST['message']);
  // }
  // }
  if(trim($_POST['time']) == '') {
  $hasError = true;
  } else {
  $time = trim($_POST['time']);
  }
 //Если ошибок нет, отправить email
  if(!isset($hasError)) {
  $emailTo = 'meblaks@gmail.com'; //Сюда введите Ваш email
  $body = "Имя: $name \n\nТелефон: $phone \n\nТема: $subject \n\nУдобное время: $time";
  $headers = 'From: My Site <'.$emailTo.'>' . "\r\n" . 'Reply-To: ';
 mail($emailTo, $subject, $body, $headers);
  $emailSent = true;
  }
  }
   ?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title><?php echo $title; if(!empty($_GET['page'])) echo ' - '.intval($_GET['page']);?></title>
	<base href="<?php echo $base; ?>" />
	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description;  if(!empty($_GET['page'])) echo ' - '.intval($_GET['page']);?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<?php if ($icon) { ?>
	<link href="<?php echo $icon; ?>" rel="icon" />
	<?php } ?>
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
	<meta name="mailru-verification" content="79958d1dc8f9e512"/>
	  <link href="/catalog/view/theme/default/stylesheet/pt-stans.css" rel="stylesheet" type="text/css" />
  <link href="/catalog/view/theme/default/stylesheet/pt-stans-bold.css" rel="stylesheet" type="text/css" />
  
	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<!-- <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.js"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
	<script type="text/javascript" src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
<!-- <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> -->
	
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css?v0.2" />
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/responsive.css" />
	<!-- <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/js/assets/owl.carousel.css" /> -->
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php if ($direction == 'rtl') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/defoult/stylesheet/rtl.css" />
<?php } ?>
	<!-- <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> -->
	<script type="text/javascript" src="catalog/view/theme/default/js/owl.carousel.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script type="text/javascript" src="catalog/view/theme/default/js/jquery.cookie.js"></script>


<link href="catalog/view/theme/default/js/colorbox/custom_colorbox.css" rel="stylesheet" type="text/css" />
	
<script type="text/javascript" src="catalog/view/theme/default/js/colorbox/jquery.colorbox-min.js"></script>

	<script type="text/javascript" src="catalog/view/theme/default/js/cosyone_common.js"></script>


	<?php foreach ($scripts as $script) { ?>
		<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>

	<!--[if IE 8]>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/cosyone/stylesheet/ie8.css" />
	<![endif]-->
	<?php echo $google_analytics; ?>
	<?php echo $cosyone_styles; ?>
</head>

<body class="<?php echo $class; ?>">

	<script type="text/javascript">

		if (window.top !== window.self) {
		document.write = "";
		window.top.location = window.self.location;
		setTimeout(function(){document.body.innerHTML='';},1);
		window.self.onload=function(evt){
		document.body.innerHTML='';};};

	</script>
<div class="bg">
	
</div>
<a id="uptocall-mini">
<div class="uptocall-mini-phone"></div>
</a>
<div class="forma_wrapper">
    <div class="forma_wrapper2">
<div id="contact-wrapper">
		<div class="cross">
			x
		</div>
<form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>" id="contactform">
<p class="title">Заказать обратный звонок</p>
						<div class="col-sm-7">
<div class="col-xs-12">
<label for="name"><strong>Ваше имя:</strong></label>
<input type="text" size="50" name="contactname" id="contactname" value="" class="required" />
</div>
 <!-- <div>
  <label for="email"><strong>Email:</strong></label>
  <input type="text" size="50" name="email" id="email" value="" class="required email" />
  </div> -->
 <div class="col-sm-6">
  <label for="subject"><strong>Тема:</strong></label>
  <input type="text" size="50" name="subject" id="subject" value="" class="required" />
  </div>
 <div class="col-sm-6">
  <label for="time"><strong>Удобное время для звонка:</strong></label>
<input type="text" size="15" name="time" id="time" value="" class="required" />
  </div>
  							</div>
  							<div class="col-sm-5">
  <div>		
				
<label for="phone"><strong>Телефон:</strong></label>
<input type="text" size="13" name="phone" id="phone" value="" class="required" />
</div>
			</div>
  <input type="submit" value="Отправить" name="submit" onclick="ga('send', 'pageview', '/virtual/callback');"/>
  </form>
  </div>
</div>
</div>
  <script type="text/javascript">
  $(document).ready(function(){

	  $("#contactform").validate();
	  jQuery.extend(jQuery.validator.messages, {
        required: "Это поле необходимо заполнить",
        remote: "Исправьте это поле чтобы продолжить",
        email: "Введите правильный email адрес.",
        url: "Введите верный URL.",
        date: "Введите правильную дату.",
        dateISO: "Введите правильную дату (ISO).",
        number: "Введите число.",
        digits: "Введите только цифры.",
        creditcard: "Введите правильный номер вашей кредитной карты.",
        equalTo: "Повторите ввод значения еще раз.",
        accept: "Пожалуйста, введите значение с правильным расширением.",
        maxlength: jQuery.validator.format("Нельзя вводить более {0} символов."),
        minlength: jQuery.validator.format("Должно быть не менее {0} символов."),
        rangelength: jQuery.validator.format("Введите от {0} до {1} символов."),
        range: jQuery.validator.format("Введите число от {0} до {1}."),
        max: jQuery.validator.format("Введите число меньше или равное {0}."),
        min: jQuery.validator.format("Введите число больше или равное {0}.")
});
});
</script>
	<header>
		<div class="container header">
			<?php if ($logo) { 
			
			?>
			    <div class="logo">
			    	<? if($_SERVER['REQUEST_URI'] != '/'): ?><a href="/"><? endif; ?><img src="<?php echo $logo; ?>" title="Интернет - магазин мебели Meblaks" alt="Интернет - магазин мебели Meblaks" /><? if($_SERVER['REQUEST_URI'] != '/'): ?><a><? endif; ?>
			    </div>
		    <?php } ?>
        
 
  <div class="contact">
<div class="phones">
	 	<a href="tel:0955690804" class="header_phone"><span>(095)</span> 569 - 08 - 04</a>
  		<a href="tel:0983357385" class="header_phone"><span>(098)</span> 335 - 73 - 85</a>
	 	</div>
  	
  
  </div>
  	<div class="everyday">
  		<p>пн-пт: 9:00 - 19:00 </p>
  		<p>сб: 9:00 - 15:00</p>
  		<p>вс: выходной</p>
  		<div class="call">Заказать звонок</div>
  	</div>
  <div class="search_menu">
	 <div class="search_menu_menu">
	 	
	 	<a href="https://www.meblaks.com.ua/delivery">Доставка и оплата</a>
	 	<a href="https://www.meblaks.com.ua/Guarantees">Гарантии</a>
	 	<a href="https://www.meblaks.com.ua/reviews">Отзывы</a>
		<a href="https://www.meblaks.com.ua/contact">Контакты</a>

	 </div>
  	 <?php echo $search; ?>
  <!-- 	  <div class="search_menu_menu">
  	 
  	 </div> -->
  </div>
  <div class="cart_login">
  	<?php echo $header_login; ?>
  	<?php echo $cart;  ?>
  </div>
	</div>

	 
	 <!-- <?php echo $language; ?> -->
	<!-- <?php echo $currency; ?> -->




	<!-- <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a> -->
	<!-- <a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a> -->
<!--  <a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
 <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a> -->


<div class="nav_wrapper">
	<div class="menu_mob">
	<i class="fa fa-bars" aria-hidden="true"></i>
		Каталог
	</div>

	<ul class="nav container">

	<!-- 	<li class="home only_desktop <?php echo $cosyone_show_home_icon; ?>">
			<a href="<?php echo $home; ?>"><?php echo $text_home; ?></a>
		</li> -->

		<?php if ($categories) { ?>

			<?php foreach ($categories as $category_1) { ?>

				<?php if ($category_1['category_1_id'] == $category_1_id) { ?>
					<li class="col<?php echo $category_1['column']; ?> current">
						<a href="<?php echo $category_1['href']; ?>" >
							<?php echo $category_1['name']; ?>
							<!-- <i class="fa fa-sort-desc"></i> -->
						</a>
						<?php } else { ?>
						<li class="col<?php echo $category_1['column']; ?>">
							<a href="<?php echo $category_1['href']; ?>" >
								<?php echo $category_1['name']; ?>
								<a class="mobile minus">x</a>
							</a>
							<?php } ?>
							<?php if ($category_1['children']) { ?>

								<div class="menu_drop_down" style="width: <?php echo ((($category_1['column']) * (195)) + (10)); ?>px">

									<div class="wrapper">
										<ul>
											<?php foreach ($category_1['children'] as $category_2) { ?>
												<li class="column level2">
													<a href="<?php echo $category_2['href']; ?>">
														<?php echo $category_2['name']; ?>
														<!-- <i class="fa fa-caret-right"></i> -->
													</a>
													<?php if($cosyone_menu_mega_second_thumb == 'enabled' && $category_2['thumb']) { ?>
														<a href="<?php echo $category_2['href']; ?>" class="sub_thumb">
															<img src="<?php echo $category_2['thumb']; ?>" alt="<?php echo $category_2['name']; ?>"/>
														</a>
													<?php } ?>
													<?php if ($category_2['children']) { ?>
														<div class="third">
															<ul>
																<?php foreach ($category_2['children'] as $category_3) { ?>
																<li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
																<?php } ?>
															</ul>
														</div>
													<?php } ?>
												</li>
											<?php } ?>
										</ul>
									</div><!-- wrapper ends -->

								</div>
							<?php } ?>
						</li>

					<?php } ?>

				<?php } ?>

				<?php if($cosyone_custom_menu_block == 'enabled'){ ?>
					<li class="withsubs custom_block">
						<a><?php echo $cosyone_custom_menu_block_title; ?>
							<i class="fa fa-sort-desc"></i>
						</a>
						<div class="menu_drop_down" style="width:<?php echo $cosyone_menu_block_width; ?>px">
							<?php echo $cosyone_menu_custom_block_content; ?>
						</div>
					</li>
				<?php } ?>

				<?php if($cosyone_custom_menu_title1){ ?>
				<li><a href="<?php echo $cosyone_custom_menu_url1 ?>"><?php echo $cosyone_custom_menu_title1; ?></a></li>
				<?php } ?>

				<?php if($cosyone_custom_menu_title2){ ?>
				<li><a href="<?php echo $cosyone_custom_menu_url2 ?>"><?php echo $cosyone_custom_menu_title2; ?></a></li>
				<?php } ?>

				<?php if($cosyone_custom_menu_title3){ ?>
				<li><a href="<?php echo $cosyone_custom_menu_url3; ?>"><?php echo $cosyone_custom_menu_title3; ?></a></li>
				<?php } ?>

				<?php if($cosyone_custom_menu_title4){ ?>
				<li><a href="<?php echo $cosyone_custom_menu_url4; ?>"><?php echo $cosyone_custom_menu_title4; ?></a></li>
				<?php } ?>

				<?php if($cosyone_custom_menu_title5){ ?>
				<li><a href="<?php echo $cosyone_custom_menu_url5; ?>"><?php echo $cosyone_custom_menu_title5; ?></a></li>
				<?php } ?>

	</ul>

</div>
</header>
	<div id="notification" class="container"></div>