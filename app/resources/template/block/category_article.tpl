<article class="post-card">
    <div class="post-image">
        <img src="{$blog->img}" alt="{$blog->title}">
    </div>
    <div class="post-content">
        <h3 class="post-title">{$blog->title}</h3>
        <p class="post-date">{$blog->getDate('create_at', 'M j, Y')}</p>
        <p class="post-excerpt">{$blog->description}</p>
        <a href="/category/{$categoryId}/blog/{$blog->id}" class="continue-reading">Continue Reading</a>
    </div>
</article>