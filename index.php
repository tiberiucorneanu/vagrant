<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
  <?php if(mysql_num_row($result) >0): ?>
    <ul>
      <?php while($row = mysql_fetch_object($result)): ?>
        <li><?php echo $row->text; ?></li>
      <?php endwhile; ?>
    </ul>
  <?php else: ?>
    <p>no posts</p>
  <?php endif; ?>

  <--<?php phpinfo(); >-->
</body>
</html>
