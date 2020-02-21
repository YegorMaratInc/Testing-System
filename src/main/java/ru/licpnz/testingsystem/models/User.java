package ru.licpnz.testingsystem.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * 28/11/2019
 * User
 *
 * @author havlong
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "it_sprint_user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstName;
    private String lastName;

    private String login;
    private String hashPassword;
    @ManyToOne
    private Language lastLanguage;

    @Enumerated(value = EnumType.STRING)
    private UserRole userRole;
    @Enumerated(value = EnumType.STRING)
    private UserState userState;

}
