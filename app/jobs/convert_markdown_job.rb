class ConvertMarkdownJob < ApplicationJob
  queue_as :default

  def perform(blog_post)
    renderer = Redcarpet::Render::HTML.new(no_images: true,
                                           no_links: true,
                                           filter_html: true)
    markdown = Redcarpet::Markdown.new(renderer, tables: true,
                                                 fenced_code_blocks: true, autolink: true)
    blog_post.blog_entry_html = markdown.render(blog_post.blog_entry)
    blog_post.save
  end
end
