package cc.ryanc.halo.repository;

import cc.ryanc.halo.model.domain.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * <pre>
 *     标签持久层
 * </pre>
 *
 * @author : RYAN0UP
 * @date : 2018/1/12
 */
public interface TagRepository extends JpaRepository<Tag, Long> {

    /**
     * 根据标签路径查询，用于验证是否已经存在该路径
     *
     * @param tagUrl tagUrl
     * @return Tag
     */
    Tag findTagByTagUrl(String tagUrl);

    /**
     * 根据标签名称查询
     *
     * @param tagName 标签名
     * @return Tag
     */
    Tag findTagByTagName(String tagName);

    /**
     * 查询所有下面有已发布文章的标签
     * @return list
     */
    @Query(value = "select distinct t from Tag t join fetch t.posts p where p.postStatus = 0 order by p.postUrl")
    List<Tag> findAllHasPostedTags();
}
