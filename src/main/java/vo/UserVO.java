package vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private int idx;
	private String id, pwd, name, pnum, regidate, regiip, gender, email, birth, addr;

}