package com.CarProject.Reply;

public class ResponseBean {
    private String status;  // 상태 (success/failure)
    private String message; // 메시지 (성공/실패 설명)

    // 기본 생성자
    public ResponseBean() {}

    // Getter & Setter
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
