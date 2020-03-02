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

    @JoinColumn(name = "owner_id")
    @ManyToOne
    private User owner;

    @JoinColumn(name = "problem_id")
    @ManyToOne
    private Problem problem;

    @JoinColumn(name = "language_id")
    @ManyToOne
    private Language language;

    @Temporal(TemporalType.TIMESTAMP)
    private Date submissionTime;

    private String pathToProgram;

    @Enumerated(EnumType.STRING)
    private SubmissionState state;
    private Integer lastTest;
}
