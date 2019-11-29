package ru.licpnz.testingsystem.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * 29.11.2019
 * Language
 *
 * @author Havlong
 * @version v1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "it_sprint_language")
public class Language {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String compilationCommand;
    private String runCommand;
    private String compiledFileName;
    private String programName;
}
