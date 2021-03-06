<#include "module/page.ftl">
<@page title="姜健的博客 - ${options.blog_title}" page_title="${options.blog_title}" keywords="${options.seo_keywords?if_exists}" description="${options.seo_desc?if_exists}" slogn="${options.hux_general_index_slogn?if_exists}" cover="${options.hux_general_index_cover?default('/hux/source/img/home-bg.jpg')}">
    <#list posts.content as post>
<div class="post-preview">
    <a href="/archives/${post.postUrl}">
        <h2 class="post-title">
            ${post.postTitle}
        </h2>
    <#--{% if post.subtitle %}-->
    <#--<h3 class="post-subtitle">-->
    <#--{{ post.subtitle }}-->
    <#--</h3>-->
    <#--{% endif %}-->
        <div class="post-content-preview">
            ${post.postSummary?if_exists}
        </div>
    </a>
    <p class="post-meta">
        Posted by ${user.userDisplayName?if_exists} on ${post.postDate?string("MM-dd，yyyy")}
    </p>
</div>
<hr>
    </#list>
    <#if posts.totalPages gt 1>
<ul class="pager">
    <#if posts.hasPrevious()>
    <li class="previous">
        <#if posts.number ==1>
            <a href="/">&larr; 上一页</a>
        <#else>
            <a href="/page/${posts.number}">&larr; 上一页</a>
        </#if>
    </li>
    </#if>
    <#if posts.hasNext()>
    <li class="next">
        <a href="/page/${posts.number+2}">下一页 &rarr;</a>
    </li>
    </#if>
</ul>
    </#if>
</@page>