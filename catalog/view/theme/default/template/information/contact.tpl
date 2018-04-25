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
  
  
    <div id="content" class="">
    
    <?php echo $content_top; ?>
    
    <h1><?php echo $heading_title; ?></h1>
      
      
      
        
      
      
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <fieldset>
          <div class="box-heading"><?php echo $text_contact; ?></div>
          <div class="row">
          <div class="form-group col-sm-6 required">
            <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          <div class="form-group col-sm-6 required">
            <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
          </div>
          <div class="form-group col-sm-12 required">
            <label class="control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
          </div>
          
          <div class="form-group">
            <div class="col-sm-6">
                <?php if ($site_key) { ?>
                <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                <?php if ($error_captcha) { ?>
                <div class="text-danger"><?php echo $error_captcha; ?></div>
                <?php } ?>
                <?php } ?>
            </div>
          </div>
            <div class="col-sm-6 text-right">
            <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
          </div>
        </fieldset>
      </form>
      
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>


<?php echo $footer; ?>