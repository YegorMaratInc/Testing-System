package ru.licpnz.testingsystem.services;

import ru.licpnz.testingsystem.forms.UserForm;
import ru.licpnz.testingsystem.models.UserRole;

/**
 * 28/11/2019
 * SignUpService
 *
 * @author havlong
 * @version 1.0
 */
public interface SignUpService {
    void signUp(UserForm userForm);

    void signUp(UserForm userForm, UserRole role);
}
