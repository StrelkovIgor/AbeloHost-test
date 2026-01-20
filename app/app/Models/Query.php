<?php


namespace App\Models;


class Query
{
    public static function getThreeBlogsFromCategory()
    {
        return "WITH BlogOneCategory AS (
                    SELECT
                        blogs.id,
                        blogs.create_at,
                        blogs.title,
                        blogs.description,
                        blogs.img,
                        categories.title AS category_title,
                        category_blog.category_id,
                        ROW_NUMBER() OVER (
                            PARTITION BY blogs.id
                            ORDER BY category_blog.category_id
                        ) AS blog_row
                    FROM blogs
                    JOIN category_blog ON category_blog.blog_id = blogs.id
                    JOIN categories ON categories.id = category_blog.category_id
                ),
                RankedBlogs AS (
                    SELECT
                        *,
                        ROW_NUMBER() OVER (
                            PARTITION BY category_id
                            ORDER BY create_at DESC
                        ) AS category_row
                    FROM BlogOneCategory
                    WHERE blog_row = 1
                )
                SELECT *
                FROM RankedBlogs
                WHERE category_row <= 3
                ORDER BY category_id, create_at DESC";
    }

    public static function getCategoryById()
    {
        return "select * from categories where id = ?";
    }

    public static function getBlogsByCategory(bool $count = false, string $sort = null,?array $limit = null)
    {
        $sort = $sort ? "ORDER BY {$sort} desc" : "";
        $count = $count ? "count(*) as count" : "*";
        $limit = $limit ? "LIMIT {$limit[0]}, {$limit[1]}" : "";
        return "SELECT 
                    {$count} 
                FROM category_blog
                RIGHT JOIN blogs ON blogs.id = category_blog.blog_id
                WHERE category_blog.category_id = ? {$sort} {$limit}";
    }

    public static function getBlogIdAndCategory()
    {
        return "SELECT * 
            FROM blogs
            JOIN category_blog ON blogs.id = category_blog.blog_id
            WHERE blogs.id = ? AND category_blog.category_id = ?";

    }

    public static function updateBlogViews()
    {
        return "UPDATE blogs SET views = ? WHERE id = ?";
    }

    public static function getBlogsRandom()
    {
        return "SELECT * 
            FROM blogs
            JOIN category_blog ON blogs.id = category_blog.blog_id
            WHERE category_blog.category_id = ? AND blogs.id != ? 
            ORDER BY RAND() LIMIT 3";
    }


}