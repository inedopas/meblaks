<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>PHP Contact Form with JQuery Validation</title>
  <meta http-equiv="content-type" content="text/html;charset=utf-8" />
  <meta http-equiv="Content-Style-Type" content="text/css" />
 <script src="jquery.min.js" type="text/javascript"></script>
 <style type="text/css">
 </style>
      </head>
<body>

      <div id="contact-wrapper">
  <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>" id="contactform">
  <div>
  <label for="name"><strong>Name:</strong></label>
  <input type="text" size="50" name="contactname" id="contactname" value="" />
  </div>
 <div>
  <label for="email"><strong>Email:</strong></label>
  <input type="text" size="50" name="email" id="email" value="" />
  </div>
 <div>
  <label for="subject"><strong>Subject:</strong></label>
  <input type="text" size="50" name="subject" id="subject" value="" />
  </div>
 <div>
  <label for="message"><strong>Message:</strong></label>
  <textarea rows="5" cols="50" name="message" id="message"></textarea>
  </div>

  <input type="submit" value="Send Message" name="submit" />
  </form>
  </div>
  </body>
  </html>