<!-- Category Section -->
<section class="category-section">
    <div class="category-header">
        {if $title}
        <h2 class="category-title">{$title}</h2>
        <a href="/category/{$categoryId}" class="view-all">View All</a>
        {/if}
    </div>
    <div class="posts-grid">
        {foreach $blogs as $blog}
            {include file='block/category_article.tpl' blog=$blog categoryId=$categoryId}
        {/foreach}
    </div>
</section>