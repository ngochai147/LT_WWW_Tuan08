package iuh.fit.se.bai2.services;
import iuh.fit.se.bai2.entities.DienThoai;
import iuh.fit.se.bai2.entities.NhaCungCap;

import java.util.List;

public interface DienThoaiService {
    List<DienThoai> findAll();
    void save(DienThoai dt);
    void deleteById(Integer id);
    List<DienThoai> findByNCC(NhaCungCap ncc);
}
