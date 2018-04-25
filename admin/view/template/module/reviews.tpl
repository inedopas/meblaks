<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-reviews" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-reviews" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-order-type"><?php echo $entry_order_type; ?></label>
            <div class="col-sm-10">
              <select name="order_type" id="input-order-type" class="form-control">
                <option value="last" <?php echo($order_type === 'last' ? 'selected' : '') ?> ><?php echo $text_order_last; ?></option>
                <option value="random" <?php echo($order_type === 'random' ? 'selected' : '') ?> ><?php echo $text_order_random; ?></option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-layout"><?php echo $entry_layout; ?></label>
            <div class="col-sm-10">
              <select name="layout" id="input-layout" class="form-control">
                <option value="vertical" <?php echo($layout === 'vertical' ? 'selected' : '') ?> ><?php echo $text_vertical; ?></option>
                <option value="horizontal" <?php echo($layout === 'horizontal' ? 'selected' : '') ?> ><?php echo $text_horizontal; ?></option>
                <option value="slider" <?php echo($layout === 'slider' ? 'selected' : '') ?> ><?php echo $text_slider; ?></option>
                </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-header"><?php echo $entry_header; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                  <input type="text" name="module_header[<?php echo $language['language_id']; ?>]" value="<?php echo (isset($module_header[$language['language_id']]) ? $module_header[$language['language_id']] : ''); ?>" placeholder="<?php echo $entry_header; ?>" id="input-header" class="form-control" />
                </div>
                <?php if (isset($error_header[$language['language_id']]) && $error_header[$language['language_id']]) { ?>
                  <div class="text-danger"><?php echo $error_header[$language['language_id']]; ?></div>
                <?php } ?>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-text-limit"><?php echo $entry_text_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="text_limit" value="<?php echo $text_limit; ?>" placeholder="<?php echo $entry_text_limit; ?>" id="input-text-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-category-sensitive"><?php echo $entry_category_sensitive; ?></label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <input type="radio" name="category_sensitive" value="1" <?php echo($category_sensitive ? 'checked' : '') ?> />
                <?php echo $text_yes; ?>
              </label>
              <label class="radio-inline">
                <input type="radio" name="category_sensitive" value="0" <?php echo(!$category_sensitive ? 'checked' : '') ?> />
                <?php echo $text_no; ?>
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-show-all-button"><?php echo $entry_show_all_button; ?></label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <input type="radio" name="show_all_button" value="1" <?php echo($show_all_button ? 'checked' : '') ?> />
                <?php echo $text_yes; ?>
              </label>
              <label class="radio-inline">
                <input type="radio" name="show_all_button" value="0" <?php echo(!$show_all_button ? 'checked' : '') ?> />
                <?php echo $text_no; ?>
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>