package vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private int u_idx;
	private String u_id, u_pwd, u_name, u_pnum, u_regidate, u_regiip, u_gender, u_email, u_birth, u_addr;

}