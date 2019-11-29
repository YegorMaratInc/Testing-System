package ru.licpnz.testingsystem.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * 29.11.2019
 * NotFoundException
 *
 * @author Havlong
 * @version v1.0
 */
@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "resource not found")
public class NotFoundException extends RuntimeException {
}
