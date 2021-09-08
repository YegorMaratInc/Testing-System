package ru.licpnz.testingsystem.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Type;

import javax.persistence.*;

/**
 * 28/11/2019
 * Problem
 *
 * @author havlong
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "it_sprint_problem")
public class Problem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String shortName;
    private String name;
    private int timeLimit;
    @Type(type = "text")
    private String content;
    private String inputFormat;
    private String outputFormat;
    private String example;
    @JoinColumn(name = "contest_id")
    @ManyToOne
    private Contest contest;
}
