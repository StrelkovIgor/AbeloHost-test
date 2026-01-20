{extends file='template.tpl'}
{block name=header}
    <link rel="stylesheet" href="/css/category.css">
{/block}
{block name=bodyScript}
    <script>
        function handleSort(value) {
            const url = new URL(window.location.href);
            url.searchParams.set('sort', value);
            window.location.href = url.toString();
        }

        // Set initial value from URL
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const sort = urlParams.get('sort');
            if (sort) {
                document.getElementById('sort-select').value = sort;
            }
        }
    </script>
{/block}
{block name=content}
        <!-- Category Header with Sort -->
        <div class="category-page-header">
            <h1 class="category-title">{$category->title}</h1>
            <div class="sort-wrapper">
                <label for="sort-select">Sort by:</label>
                <select id="sort-select" onchange="handleSort(this.value)">
                    <option value="date">Date</option>
                    <option value="view">Views</option>
                </select>
            </div>
        </div>
        <div class="category-page-header">
            {$category->description}
        </div>


        <div class="posts-grid">

            {foreach $blogs as $blog}
            <article class="post-card">
                <div class="post-image"><img src="{$blog->img}" alt="{$blog->title}"></div>
                <div class="post-content">
                    <h3 class="post-title">{$blog->title}</h3>
                    <p class="post-date">{$blog->getDate('create_at', 'M j, Y')}</p>
                    <p class="post-excerpt">{$blog->description}</p>
                    <a href="/category/{$category->id}/blog/{$blog->id}" class="continue-reading">Continue Reading</a>
                </div>
            </article>
            {/foreach}

        </div>

        {$paginateTemplate}
{/block}