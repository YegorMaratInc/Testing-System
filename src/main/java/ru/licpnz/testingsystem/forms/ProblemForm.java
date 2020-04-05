package ru.licpnz.testingsystem.forms;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class ProblemForm {
    private String shortName;
    private String name;
    private int timeLimit;
    private String content;
    private String inputFormat;
    private String outputFormat;
    private String example;
    private List<MultipartFile> input;
    private List<MultipartFile> output;
}
