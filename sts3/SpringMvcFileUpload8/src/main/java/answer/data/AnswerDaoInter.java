package answer.data;

import java.util.List;
import java.util.Map;

public interface AnswerDaoInter {

	public void insertAnswer(AnswerDto dto);
	public List<AnswerDto> getAnswerList(int num);
	public int getCheckPass(int idx,String pass);
	public void deleteAnswer(int idx);
}
