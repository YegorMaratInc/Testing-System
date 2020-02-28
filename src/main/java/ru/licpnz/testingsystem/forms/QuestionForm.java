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
    //private Long problemId;
    //TODO add info about user
    //Зачем, если мы можем посмотреть с кого мы отправляем. Это должно быть не здесь, а в модельке
    private User author;
}
