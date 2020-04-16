package ru.licpnz.testingsystem.forms;

import lombok.Data;
import ru.licpnz.testingsystem.models.User;

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
    private User author;
}
