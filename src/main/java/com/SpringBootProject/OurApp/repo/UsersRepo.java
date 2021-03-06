package com.SpringBootProject.OurApp.repo;

import com.SpringBootProject.OurApp.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface UsersRepo extends JpaRepository<Users,Long> {
    Users findUsersById(Long id);
    Users findByUsername(String username);

//    @Query(value = "SELECT u.id,u.first_name,u.password,u.patronymic,u.photo_name,u.surname,u.username FROM users u INNER JOIN orders o ON u.id = o.customer_id OR u.id = o.manager_id where u.id = ?1",nativeQuery = true)
//    Iterable<Users> findOrdersById(Long id);

}
