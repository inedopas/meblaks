<div class="box">
  <!-- <div class="box-heading"><?php echo $heading_title; ?></div> -->
  <div class="box-content box-category">
	<ul class="top_category">
      ВЫВЫАВЫВЫ
       <?php foreach ($categories as $category_1) { ?>
       <?php if ($category_1['category_1_id'] == $category_1_id) { ?>
                      
               <?php if ($category_1['children']) { ?>
               <ul>
                <?php foreach ($category_1['children'] as $category_2) { ?>

                <?php if ($category_2['category_2_id'] == $category_2_id) { ?>
                <li class="active"><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a></li>
                <?php } else { ?>
          <li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a></li>
          <?php } ?>
                <?php } ?>
              </ul>
              <?php } ?>
                      
          <?php } ?>
        <?php } ?>
        
      </ul> 
  </div>
</div>
<script>        
	$('.box-category li').bind().click(function(e) {
	$(this).toggleClass("open").find('>ul').stop(true, true).slideToggle(500)
	.end().siblings().find('>ul').slideUp().parent().removeClass("open");
	e.stopPropagation();
	});
			
	$('.box-category li a').click(function(e) {
	e.stopPropagation();
	});
</script>