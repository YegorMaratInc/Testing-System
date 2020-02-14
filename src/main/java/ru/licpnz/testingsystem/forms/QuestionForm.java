package ru.licpnz.testingsystem.forms;

import lombok.Data;

/**
 * 28/11/2019
 * SubmissionForm
 *
 * @author havlong
 * @version 1.0
 */
@Data
public class QuestionForm {
    private String question;
    private Long problemId;
    //TODO add info about user
}
