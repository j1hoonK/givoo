//package com.givoo.service.serviceImp;
//
//import com.givoo.entity.Manager;
//import com.givoo.repository.ManagerRepository;
//import com.givoo.service.ManagerService;
//import org.springframework.security.core.userdetails.UserDetails;
//        import org.springframework.security.core.userdetails.UsernameNotFoundException;
//        import org.springframework.stereotype.Service;
//        import org.springframework.transaction.annotation.Transactional;
//
//import java.util.ArrayList;
//
//@Service
//public class ManagerServiceImpl implements ManagerService {
//
//    private final ManagerRepository managerRepository;
//
//    public ManagerServiceImpl(ManagerRepository managerRepository) {
//        this.managerRepository = managerRepository;
//    }
//
//    @Override
//    @Transactional
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        Manager manager = managerRepository.findByManagername(username);
//        if (manager == null) {
//            throw new UsernameNotFoundException("유저를 찾을 수 없습니다.");
//        }
//        return new org.springframework.security.core.userdetails.User(manager.getUsername(), manager.getPassword(), new ArrayList<>());
//    }
//
//    @Override
//    public void save(Manager manager) {
//        ManagerRepository.save(manager);
//    }
//}
