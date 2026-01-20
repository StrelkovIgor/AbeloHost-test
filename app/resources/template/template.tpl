<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blogy. Template</title>
    <link rel="stylesheet" href="/css/style.css">
    {block name=header}{/block}
</head>
<body>
<header class="header">
    <div class="container">
        <div class="logo">
            <a href="/">Blogy<span>.</span></a>
        </div>
    </div>
</header>

<main class="main-content">
    <div class="container">
       {block name=content}{/block}
    </div>
</main>

<footer class="footer">
    <div class="container">
        <p class="copyright">Copyright &copy; 2025. All Rights Reserved.</p>
    </div>
</footer>
{block name=bodyScript}{/block}
</body>
</html>
