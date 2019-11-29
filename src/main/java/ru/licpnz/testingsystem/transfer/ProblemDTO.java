package ru.licpnz.testingsystem.transfer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

/**
 * 29.11.2019
 * ProblemDTO
 *
 * @author Havlong
 * @version v1.0
 */
@Data
@AllArgsConstructor
@Builder
public class ProblemDTO {
    private int triesCount;
    private int timeAdded;
    private boolean solved;
}
