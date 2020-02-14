package ru.licpnz.testingsystem.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * 28/11/2019
 * Question
 *
 * @author havlong
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "it_sprint_question")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String answer;
    private String question;
    private boolean isNotification;

    @ManyToOne
    private User owner;

    @ManyToOne
    private Problem problem;

}
