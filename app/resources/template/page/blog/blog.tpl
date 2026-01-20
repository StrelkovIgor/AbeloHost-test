{extends file='template.tpl'}
{block name=header}
    <link rel="stylesheet" href="/css/blog.css">
{/block}

{block name=content}
    <section class="category-section">
        <article class="post-wrap-card">
            <div class="post-image-container">
                <img src="{$blog->img}" alt="{$blog->title}">
                <div class="image-overlay">
                    <span class="date">{$blog->getDate('create_at', 'M j, Y')}</span>
                    <span class="views">{$blog->views} views</span>
                </div>
            </div>
            <div class="post-content">
                <h3 class="post-title">{$blog->title}</h3>
                <p class="post-excerpt">
                    {$blog->description}
                </p>

                <p class="post-excerpt">
                    {$blog->text}
                </p>
            </div>
        </article>
    </section>
    {include file="block/category_section.tpl"}
{/block}