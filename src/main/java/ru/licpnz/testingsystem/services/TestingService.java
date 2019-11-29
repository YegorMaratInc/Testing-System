package ru.licpnz.testingsystem.services;

import ru.licpnz.testingsystem.forms.SubmissionForm;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.models.User;

/**
 * 28/11/2019
 * TestingService
 *
 * @author havlong
 * @version 1.0
 */
public interface TestingService {
    void test(SubmissionForm submissionForm, Problem problem, User user);
}
