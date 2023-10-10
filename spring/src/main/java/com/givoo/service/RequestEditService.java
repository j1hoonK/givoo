package com.givoo.service;

import com.givoo.entity.request.RequestEdit;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface RequestEditService {
   RequestEdit save(RequestEdit requestEdit);
   List<RequestEdit> findAll();
   Optional<RequestEdit> findById(Long id);

   void deleteById(Long id);
}
