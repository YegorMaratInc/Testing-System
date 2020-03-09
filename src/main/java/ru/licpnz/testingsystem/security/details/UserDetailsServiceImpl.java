package ru.licpnz.testingsystem.security.details;

/**
 * 28/11/2019
 * UserDetailsServiceImpl
 *
 * @author havlong
 * @version 1.0
 */
/**
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

private final UserRepository userRepository;

public UserDetailsServiceImpl(UserRepository userRepository) {
this.userRepository = userRepository;
}

 @Override public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
 return new
 UserDetailsImpl(userRepository.findUserByLogin(userName)
 .orElseThrow(IllegalArgumentException::new));
 }
}
 */