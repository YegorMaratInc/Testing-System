package ru.licpnz.testingsystem.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

/**
 * 28/11/2019
 * Submission
 *
 * @author havlong
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "it_sprint_submission")
public class Submission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private User owner;
    @ManyToOne
    private Problem problem;
    @ManyToOne
    private Language language;

    @Temporal(TemporalType.TIMESTAMP)
    private Date submissionTime;
    private String pathToProgram;

    @Enumerated(EnumType.STRING)
    private SubmissionState state;
    private Integer lastTest;
}
