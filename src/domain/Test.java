package domain;

import java.util.List;

public class Test {
	private String title;
	private String description;
	private List<Question> questionList;

	public Test(String title, String description, List<Question> questionList) {
		this.title = title;
		this.description = description;
		this.questionList = questionList;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Question> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}
}
