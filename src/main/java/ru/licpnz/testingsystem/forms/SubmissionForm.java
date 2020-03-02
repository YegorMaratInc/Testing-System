package ru.licpnz.testingsystem.forms;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

/**
 * 28/11/2019
 * SubmissionForm
 *
 * @author havlong
 * @version 1.0
 */
@Data
public class SubmissionForm {
    private MultipartFile program;
    private String languageName;
    private Long problem;
    //TODO add info about user
    //private User owner;
}
