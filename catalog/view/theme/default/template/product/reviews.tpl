<?php echo $header; ?>
<style type="text/css">
    .reviews-description {
        font-family: Georgia, Times, "Times New Roman", serif;
        font-style: italic;
    }

    .reviews-sign {
        text-align: right;
    }

    .reviews-author {
        font-weight: bold;
        text-align: right;
    }

    .reviews-date {
        text-align: right;
    }
</style>
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
  <div class="row review">

    <div id="content" class="">
    
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($reviews) { ?>
      <div class="row">
        <?php foreach ($reviews as $review) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $review['prod_href']; ?>"><img src="<?php echo $review['prod_thumb']; ?>" alt="<?php echo $review['prod_name']; ?>" title="<?php echo $review['prod_name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
            
              <h4 style="text-align:center;"><a class="h3" href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></h4>
              <?php if ($review['rating']) { ?>
              <div class="rating" style="text-align:right;" >
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($review['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <p  class="reviews-description"><?php echo $review['description']; ?></p>
              <div class="reviews-sign">
                <div class="reviews-author"><?php echo $review['author']; ?></div>
                <div class="reviews-date"><?php echo $review['date_added']; ?></div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      
</div>
<?php echo $footer; ?>