{extends file='template.tpl'}
{block name=content}
    {foreach $list as $item}
        {include file='block/category_section.tpl' title=$item['title'] categoryId=$item['id'] blogs=$item['blogs']}
    {/foreach}
{/block}