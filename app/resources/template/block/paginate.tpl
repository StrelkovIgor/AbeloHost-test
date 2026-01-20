<!-- Pagination -->
{*$paginate|debug_print_var*}
{nocache}
{if $paginate['pages'] > 1}
<nav class="pagination">
    {if $paginate['page']}
        {$paginate['get']['page'] = 1}
        {$url = http_build_query($paginate['get'])}
        <a href="?{$url}" class="page-link prev">&laquo; Previous</a>
    {/if}
    {for $i = 1 to $paginate['pages']}
        {$paginate['get']['page'] = $i}
        {$url = http_build_query($paginate['get'])}
        {if $paginate['page'] + 1 == $i}
            <a href="?{$url}" class="page-link active">{$i}</a>
        {else}
            <a href="?{$url}" class="page-link">{$i}</a>
        {/if}
    {/for}
    {if $paginate['page'] + 1 != $paginate['pages']}
        {$paginate['get']['page'] = $paginate['pages']}
        {$url = http_build_query($paginate['get'])}
        <a href="#" class="page-link next">Next &raquo;</a>
    {/if}
</nav>
{/if}
{/nocache}