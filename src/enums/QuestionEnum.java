package enums;

public enum QuestionEnum {
	ORDINAL(1L),
	CONTINUOUS(2L);
	
	Long value;
	
	QuestionEnum(Long value) {
		this.value = value;
	}
}
