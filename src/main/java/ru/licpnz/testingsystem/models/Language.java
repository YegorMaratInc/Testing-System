package ru.licpnz.testingsystem.models;

import lombok.*;

import javax.persistence.*;

/**
 * 29.11.2019
 * Language
 *
 * @author Havlong
 * @version v1.0
 */
@Data
@EqualsAndHashCode
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

    private String extension;

    @Column(name = "path_to_scripts")
    private String pathToScripts;
}
