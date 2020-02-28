package ru.licpnz.testingsystem.security.details;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.licpnz.testingsystem.repositories.UserRepository;

/**
 * 28/11/2019
 * UserDetailsServiceImpl
 *
 * @author havlong
 * @version 1.0
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UserRepository userRepository;

    public UserDetailsServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        return new
                UserDetailsImpl(userRepository.findUserByLogin(userName)
                .orElseThrow(IllegalArgumentException::new));
    }
}
