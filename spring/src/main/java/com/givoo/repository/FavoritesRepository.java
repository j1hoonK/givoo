package com.givoo.repository;

import com.givoo.entity.Favorites;
import com.givoo.entity.Users;
import com.givoo.entity.donation.Donation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FavoritesRepository extends JpaRepository<Favorites,Long> {
    List<Favorites> findAllByUserId(Long userId);
}
