package ru.licpnz.testingsystem.forms;

import lombok.Data;

/**
 * 28/11/2019
 * UserForm
 *
 * @author havlong
 * @version 1.0
 */
@Data
public class UserForm {
    private String firstName;
    private String lastName;
    private String login;
    private String password;
}
