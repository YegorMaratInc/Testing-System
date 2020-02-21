package ru.licpnz.testingsystem.forms;

import lombok.Data;

import java.util.Date;

@Data
public class ContestForm {
    private String title;
    private Date startTime;
    private Date finishTime;
}
