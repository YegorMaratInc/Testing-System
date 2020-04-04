package ru.licpnz.testingsystem.transfer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class ProblemDTO {
    private int triesCount;
    private int timeAdded;
    private boolean solved;
    private String problemShortName;
}
