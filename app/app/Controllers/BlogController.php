<?php


namespace App\Controllers;


use App\Models\Blog;
use App\Models\Category;
use App\Models\Query;
use Bootstrap\App\Contract\DataBaseContract;
use Bootstrap\App\Contract\ViewContract;
use App\Controllers\Traits\PaginateTrait;
use Bootstrap\Exceptions\NotFoundException;

class BlogController
{
    use PaginateTrait;

    public function home(DataBaseContract $db, ViewContract $view)
    {
        $view->cache('page/home.tpl', 'home', function($view) use ($db){
            $listBlog = [];
            $rows = $db->query(Query::getThreeBlogsFromCategory())
                ->model(Blog::class)
                ->get();

            foreach ($rows as $row) {
                if(!isset($listBlog[$row->category_id])) {
                    $listBlog[$row->category_id] = [
                        'id' => $row->category_id,
                        'title' => $row->category_title,
                        'blogs' => []
                    ];
                }

                $listBlog[$row->category_id]['blogs'][] = $row;
            }

            $view->setVariables('list', $listBlog);
        }, 1200);
    }

    public function category($categoryId, DataBaseContract $db, ViewContract $view)
    {
        $idCache = md5(implode('.', $_GET) . $categoryId);
        $view->cache('page/blog/category.tpl', $idCache, function($view) use($categoryId, $db){
            $categoryId = (int) $categoryId;
            $sort = "create_at";
            if(isset($_GET['sort']) && $_GET['sort'] == 'view') {
                $sort = "views";
            }
            $category = $db->query(Query::getCategoryById(), [$categoryId])->model(Category::class)->first();
            if(!$category) {
                throw new NotFoundException();
            }

            $count = $db->query(Query::getBlogsByCategory(count: true, sort: $sort), [$categoryId])->first();
            $limit = $this->getPaginate($count->count, $view);

            $blogs = $db->query(Query::getBlogsByCategory(sort: $sort, limit: $limit), [$categoryId])->model(Blog::class)->get();
            $view->setVariables('blogs', $blogs)
                ->setVariables('category', $category);
        });
    }

    public function blog($categoryId, $blogId, DataBaseContract $db, ViewContract $view)
    {
        $blog = $db->query(Query::getBlogIdAndCategory(), [(int) $blogId, (int) $categoryId])->model(Blog::class)->first();
        if(!$blog) {
            throw new NotFoundException();
        }

        $db->query(Query::updateBlogViews(), [$blog->views + 1, $blog->id]);

        $blogsRandom = $db->query(Query::getBlogsRandom(), [(int) $categoryId, $blog->id])->model(Blog::class)->get();

        $view->setVariables('blog', $blog)
            ->setVariables(['blogs' => $blogsRandom, 'categoryId' => $categoryId])
            ->render('page/blog/blog.tpl');
    }
}