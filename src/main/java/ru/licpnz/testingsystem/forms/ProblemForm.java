package ru.licpnz.testingsystem.forms;

import lombok.Data;

@Data
public class ProblemForm {
    private String shortName;
    private String name;
    private int timeLimit;
    private String content;
    private String inputFormat;
    private String outputFormat;
}
