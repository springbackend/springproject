package vo;

import lombok.Data;

@Data
public class ProductCommentVO {
	private int pc_idx,p_idx,u_idx,pc_good;
	private String pc_content,pc_image;

}
