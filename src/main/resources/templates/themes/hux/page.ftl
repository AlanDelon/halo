<#include "module/page.ftl">
<@page title="${post.postTitle} - ${options.blog_title}" page_title="${post.postTitle}" keywords="${options.seo_keywords?if_exists}" description="${post.postSummary?if_exists}" cover="${post.postThumbnail?if_exists}">
    ${post.postContent}
</@page>