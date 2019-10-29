package domain;

import enums.QuestionEnum;

public class Question {
	private String title;
	private String description;
	private QuestionEnum questionType;
	private String img; // Ver melhor como sera salvo imgs

	public Question(String title, String description, QuestionEnum questionType, String img) {
		this.title = title;
		this.description = description;
		this.questionType = questionType;
		this.img = img;
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

	public QuestionEnum getQuestionType() {
		return questionType;
	}

	public void setQuestionType(QuestionEnum questionType) {
		this.questionType = questionType;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
